<?php

/**
 * get event object by id
 * $uuid ACF field event
 */
function getEventByUUID($uuid)
{
	$query = new WP_Query([
		'post_type'			=> 'events',
		'posts_per_page'	=> 1,
		'meta_query' => [
			[
				'key' 		=> 'guid',
				'compare'	=> '=',
				'value' 	=> $uuid
			]
		]
	]);

	if (count($query->posts) > 0) {
		return $query->posts[0];
	}
	return false;
}

/**
 * get user data use id
 */
function getUserDataById($id)
{
	$user = get_user_by('id', $id);

	return [
		'email' => $user->data->user_email
	];
}

/**
 * get all ticket for some Order
 */
function getOrderTickets($order_id)
{
	global $wpdb;

	$result = $wpdb->get_results("SELECT * FROM wp_tickets WHERE order_id='" . $order_id . "'", ARRAY_A);

	return $result;
}

/**
 * remove tickets (Array)
 */
function removeTickets($arr_ids)
{
	global $wpdb;

	$wpdb->show_errors();

	$ids = implode(',', array_map('absint', $arr_ids));
	return $wpdb->query("DELETE FROM wp_tickets WHERE id IN($ids)");
}


/**
 * update tickets status
 */
function updateTicketsStatus($order_id, $status)
{
	global $wpdb;

	if ($status == 'approved' || $status == 'payed') {
		aproverTicketByIdOrder($order_id, $status);
	} else {
		$wpdb->update(
			'wp_tickets',
			[
				'status' 		=> $status,
				'hash' 			=> NULL,
				'image_id'		=> NULL
			],
			['order_id' => $order_id]
		);
	}

	return true;
}

function aproverTicketByIdOrder($orderId, $status)
{
	global $wpdb;

	$tickets = $wpdb->get_results(
		"
        SELECT *
        FROM wp_tickets
        WHERE order_id = '$orderId'
		",
		ARRAY_A
	);
	foreach ($tickets as $single_ticket) {
		$hash_key = bin2hex(random_bytes(14));

		$url = get_home_url() . '/check-ticket?hash_key=' + $hash_key;
		$path = get_template_directory() . '/images/';
		$file = $path . uniqid() . ".png";

		QRcode::png($url, $file);

		$file_array = [
			'name'     => basename($file),
			'tmp_name' => $file
		];

		$image_id = media_handle_sideload($file_array, 0);

		// TODO add image_id qr code
		// print_r([
		// 	'status' 		=> $status,
		// 	'hash' 			=> $hash_key,
		// 	'image_id'		=> $image_id,
		// 	'file_array'	=> $file_array
		// ]);

		$wpdb->update(
			'wp_tickets',
			[
				'status' 		=> $status,
				'hash' 			=> $hash_key,
				//'image_id'		=> $image_id
			],
			[
				'id' => $single_ticket['id']
			],
			['%s', '%s'],
			//, '$d'
			['%d']
		);
	}
}
