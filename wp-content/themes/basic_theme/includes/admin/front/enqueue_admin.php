<?php

function admin_styles_and_scripts()
{
    wp_register_script('admin-main-script', get_template_directory_uri() . '/dist/js/script_admin.js', array(), '1.0.0', true);
    wp_register_script('admin', get_template_directory_uri() . '/dist/js/admin.js', array(), '1.0.0', true);
    wp_enqueue_script('admin-main-script');
    wp_enqueue_script('admin');

    wp_register_style('admin_styles_custom', get_template_directory_uri() . '/dist/css/admin_styles_custom.css', array(), '1.0', 'all');
    wp_enqueue_style('admin_styles_custom');



    wp_localize_script('admin-main-script', 'api_settings', array(
        'root'          => esc_url_raw(rest_url()),
        'nonce'         => wp_create_nonce('wp_rest'),
        'ajax_url'      => site_url() . '/wp-admin/admin-ajax.php',
        'template'      => get_bloginfo('template_url') . '/'
    ));
}
