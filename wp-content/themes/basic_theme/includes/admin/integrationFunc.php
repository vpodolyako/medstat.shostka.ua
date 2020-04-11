<?php

function checkKeyIntegration()
{
    $secret_key_site = get_field('secret_key', 'option');

    return $_POST['secret_key'] == $secret_key_site;
}

function checkrequiredField($data, $fieldRequired)
{
    $error = false;
    foreach ($fieldRequired as $field) {
        if (!isset($data[$field])) {
            $error = [
                'status'    => 'error',
                'message'   => 'Field ' . $field . ' required'
            ];
        }
    }

    if ($error) {
        wp_send_json($error);
    }
}


function getUserByUUID($uuid)
{
    $user = get_users([
        'number' => 1,
        'meta_query' => [
            [
                'key' => 'contactid',
                'compare' => '=',
                'value' => $uuid
            ]
        ]
    ]);

    return count($user) > 0 ? $user[0] : false;
}

function setUserRoles($user, $roles)
{
    userRemoveAllRoles($user);

    $roles = explode(",", $roles);

    foreach ($roles as $role) {
        $user->add_role($role);
    }

    return $user;
}

function userRemoveAllRoles($user)
{
    foreach ($user->roles as $role) {
        $user->remove_role($role);
    }
}


/**
 * find if exist post E Publication record
 */
function getEPublication($uuid)
{
    $query = new WP_Query([
        'post_type'            => 'e_publication_type',
        'posts_per_page'    => 1,
        'meta_query' => [
            [
                'key'       => 'guid',
                'compare'   => '=',
                'value'     => $uuid
            ]
        ]
    ]);

    return count($query->posts) > 0 ? $query->posts[0]->ID : false;
}

/**
 * find if exist post company record
 */
function getCompanyByUUID($uuid)
{
    $query = new WP_Query([
        'post_type'            => 'companies',
        'posts_per_page'    => 1,
        'meta_query' => [
            [
                'key'       => 'guid',
                'compare'   => '=',
                'value'     => $uuid
            ]
        ]
    ]);

    return count($query->posts) > 0 ? $query->posts[0]->ID : false;
}

function saveBase64Image($image)
{
    $upload_dir = wp_upload_dir();
    $upload_path = str_replace('/', DIRECTORY_SEPARATOR, $upload_dir['path']) . DIRECTORY_SEPARATOR;

    $str    = explode(";base64,", $image);
    $type   = explode("/", $str[0])[1];
    $type   = $type == 'svg+xml' ? 'svg' : $type;
    $image  = str_replace('data:image/png;base64,', '', $image);
    $image  = str_replace('data:image/svg+xml;base64,', '', $image);

    $decoded = base64_decode($image);
    $filename = 'image_' . time() . '.' . $type;
    $hashed_filename = md5($filename . microtime()) . '_' . $filename;
    $image_upload = file_put_contents($upload_path . $hashed_filename, $decoded);

    // Without that I'm getting a debug error!?
    if (!function_exists('wp_get_current_user')) {
        require_once(ABSPATH . 'wp-includes/pluggable.php');
    }

    $file             = array();
    $file['error']    = '';
    $file['tmp_name'] = $upload_path . $hashed_filename;
    $file['name']     = $hashed_filename;
    $file['type']     = 'image/png';
    $file['size']     = filesize($upload_path . $hashed_filename);
    // upload file to server
    // use $file instead of $image_upload
    $file_return = wp_handle_sideload($file, array('test_form' => false));

    $filename = $file_return['file'];
    $attachment = array(
        'post_mime_type' => $file_return['type'],
        'post_title' => preg_replace('/\.[^.]+$/', '', basename($filename)),
        'post_content' => '',
        'post_status' => 'inherit',
        'guid' => $wp_upload_dir['url'] . '/' . basename($filename)
    );

    return wp_insert_attachment($attachment, $filename);
}
