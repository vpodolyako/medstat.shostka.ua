<?php
function EventManagmentActionHandler()
{
    global $wpdb, $cur_lang, $image_id;

    if ($_POST['action_handler'] == 'approve') {

        $hash_key = bin2hex(random_bytes(14));
        //TODO need change 
        $url = 'http://acc.veedoo.io/check-ticket?hash_key=' . $hash_key;
        $path = ABSPATH . 'wp-content/uploads/images_qr/';


        $file = $path . uniqid() . ".png";
        QRcode::png($url, $file);

        $file_array = [
            'name'     => basename($file),
            'tmp_name' => $file
        ];

        $image_id = media_handle_sideload($file_array, 0);

        $request_status = $wpdb->update(
            $wpdb->prefix . 'tickets',
            array('status' => 'approved', 'hash' => $hash_key, 'image_id' => $image_id),
            array(
                'id' => $_POST['user_id']
            ),
            array('%s', '%s'),
            array('%s')
        );

        $user_search = $_POST['user_id'];

        $event_info = $wpdb->get_row(
            "
            SELECT *
            FROM wp_tickets
            WHERE id = '$user_search'
            ",
            ARRAY_A
        );



        $event_title = get_the_title($event_info['event_id']);

        $subject =  "Your ticket to the ACC event: ";

        $message = '<h2>' . $subject . ' <b>' . $event_title . '</b></h2>'
            . '<p><b>Назва події/Event title : </b>' . $event_title . '<p>'
            . '<p><b>Дата/Date : </b>' . get_field('date', $event_info['event_id']) . '<p>'
            . '<p><b>Місце/Place : </b>' . get_field('place', $event_info['event_id']) . '<p>'
            . '<p><b>Час/Time : </b>' . get_field('time_intervals', $event_info['event_id']) . '<p>'
            . '<p><b>E-mail : </b>' . $event_info['buyer_id'] . '<p>'
            . '<p><b>Телефон / Phone: </b>' . $event_info['client_phone'] . '<p>'
            . '<p><b>Контроль / Control: </b><p>'
            . '<img src="' . wp_get_attachment_image_url($event_info['image_id']) . '"></img>';

        $mailto = get_field('email_for_messages', 'option');

        $headers  = 'From: ' . get_bloginfo('name') . ' <no-reply@' . $_SERVER['HTTP_HOST'] . '>' . "\r\n" .
            'Reply-To: ' . get_bloginfo('name') . ' <no-reply@' . $_SERVER['HTTP_HOST'] . '>' . "\r\n" . "Content-type: text/html; charset=utf-8 \r\n";

        $email_result = wp_mail($mailto, $subject, $message, $headers);

        $resp = array(
            'message' => "Ticket approved",
            'response' => true,
        );
    }

    if ($_POST['action_handler'] == 'reject') {
        $in_status = $wpdb->update(
            $wpdb->prefix . 'tickets',
            array('status' => 'reject'),
            array(
                'id' => $_POST['user_id']
            ),
            array('%s'),
            array('%s')
        );
    }

    if ($_POST['action_handler'] == 'visited') {

        $request_status = $wpdb->update(
            $wpdb->prefix . 'tickets',
            array('visited' => 1),
            array(
                'id' => $_POST['user_id']
            ),
            array('%s'),
            array('%s')
        );
    }

    $resp = array(
        'action_type' => $_POST['action_handler'],
        'hash' => $hash_key,
        '$request_status' => $request_status,
        'image' => $image_id,
        'success' =>  'true',
    );

    wp_send_json($resp);
}

add_action('wp_ajax_nopriv_EventManagmentActionHandler', 'EventManagmentActionHandler');
add_action("wp_ajax_EventManagmentActionHandler", "EventManagmentActionHandler");

/**
 * get all event for events page
 */
function eventsAdmin()
{
    $query = new WP_Query([
        'post_type'         => 'events',
        'posts_per_page'    => '20',
        'post_status'       => 'publish',
        'paged'             => $_POST['page'] ?: 1,
        // 'meta_query' => [
        //     [
        //         'key'       => 'lang',
        //         'value'     => ['en', 'ua'],
        //         'compare'   => 'IN'
        //     ]
        // ]
    ]);

    $pages = [];
    if (count($query->posts) > 0) {
        foreach ($query->posts as $item) {
            $pages[] = [
                'id'        => $item->ID,
                'title'     => $item->post_title,
                'author'    => $item->post_author,
                'date'      => $item->post_date,
                'lang'      => pll_get_post_language($item->ID, 'name'),
                'allTicket' => getCountTicket(get_field('guid', $item->ID)),
                'approve'   => getCountAproveTicket(get_field('guid', $item->ID))
            ];
        }
    }


    $resp = array(
        'status'            => 'done',
        'data'              => $pages,
        'pages'             => $query->max_num_pages
    );

    wp_send_json($resp);
}
add_action("wp_ajax_events_for_admin", "eventsAdmin");

/**
 * get all ticket for Event
 */
function getTicketsByEvent()
{
    global $wpdb;

    $result = $wpdb->get_results("SELECT * FROM wp_tickets WHERE event_id = '" . $_POST['uuid'] . "'", ARRAY_A);

    $resp = array(
        'status'            => 'done',
        'data'              => $result
    );

    wp_send_json($resp);
}
add_action("wp_ajax_get_ticket_by_event", "getTicketsByEvent");

/**
 * get ticket
 */
function getTicketsInfo()
{
    global $wpdb;

    $result = $wpdb->get_row("SELECT * FROM wp_tickets WHERE id='" . $_POST['ticket_id'] . "'", ARRAY_A);

    $result['user'] = getUserDataById($result['user_id']);
    $result['event'] = getEventByUUID($result['event_id']);


    $resp = array(
        'status'            => 'done',
        'data'              => $result
    );

    wp_send_json($resp);
}
add_action("wp_ajax_get_ticket_info", "getTicketsInfo");

/**
 * update ticket data
 */
function updateTicketData()
{
    global $wpdb;

    $result = $wpdb->update(
        'wp_tickets',
        [
            'customer_email'        => $_POST['customer_email'],
            'client_company'        => $_POST['client_company'],
            'client_first_name'     => $_POST['client_first_name'],
            'client_last_name'      => $_POST['client_last_name'],
            'client_phone'          => $_POST['client_phone'],
            'client_position'       => $_POST['client_position'],
            'visited'               => $_POST['visited'],
            'comment'               => $_POST['comment'],
        ],
        [
            'id' => $_POST['id']
        ],
        ['%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s'],
        ['%d']
    );


    $resp = array(
        'status'            => 'done',
        'data'              => $result
    );

    wp_send_json($resp);
}
add_action("wp_ajax_update_ticket", "updateTicketData");


/**************************************************************************
 * Order
 */

/**
 * get all order
 */
function ordersAdmin()
{
    global $wpdb;
    $wpdb->show_errors();

    $offset = (int) $_POST['page'] * 10;

    $result = $wpdb->get_results('SELECT * FROM wp_orders LIMIT 10 OFFSET ' . $offset, ARRAY_A);
    $count = $wpdb->get_var('SELECT COUNT(*) FROM wp_orders');


    $resp = array(
        'status'            => 'done',
        'data'              => $result,
        'pages'             => ceil($count / 10),
        'count'             => $count
    );

    wp_send_json($resp);
}
add_action("wp_ajax_orders_for_admin", "ordersAdmin");

/**
 * get order
 */
function getOrderInfo()
{
    global $wpdb;

    $result = $wpdb->get_row("SELECT * FROM wp_orders WHERE order_id='" . $_POST['order_id'] . "'", ARRAY_A);

    $result['user'] = getUserDataById($result['user_id']);
    $result['event'] = getEventByUUID($result['event_id']);
    $result['tickets'] = getOrderTickets($result['order_id']);


    $resp = array(
        'status'            => 'done',
        'data'              => $result
    );

    wp_send_json($resp);
}
add_action("wp_ajax_get_order_info", "getOrderInfo");

/**
 * update ticket data
 */
function updateOrderData()
{
    global $wpdb;

    $wpdb->show_errors();

    $result = $wpdb->update(
        'wp_orders',
        [
            'customer_email'        => $_POST['customer_email'],
            'order_status'          => $_POST['order_status'],
            'comment'               => $_POST['comment']
        ],
        [
            'order_id' => $_POST['order_id']
        ],
        ['%s', '%s', '%s'],
        ['%d']
    );

    updateTicketsStatus($_POST['order_id'], $_POST['order_status']);

    if (isset($_POST['removeTickets']) && count($_POST['removeTickets']) > 0) {
        removeTickets($_POST['removeTickets']);
    }


    $resp = array(
        'status'            => 'done',
        'data'              => $result
    );

    wp_send_json($resp);
}
add_action("wp_ajax_update_order", "updateOrderData");
