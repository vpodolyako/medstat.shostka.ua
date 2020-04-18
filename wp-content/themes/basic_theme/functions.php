<?php


// //const
global $userInfo, $options_fields, $userId, $cur_lang;

//includes
include(get_template_directory() . '/includes/enqueue.php');
include(get_template_directory() . '/includes/endpoints.php');
include(get_template_directory() . '/includes/setup.php');
include(get_template_directory() . '/includes/additional_func.php');
include(get_template_directory() . '/includes/post_type_and_tax.php');



require_once ABSPATH . 'wp-admin/includes/image.php';
require_once ABSPATH . 'wp-admin/includes/file.php';
require_once ABSPATH . 'wp-admin/includes/media.php';
//hooks

//scripts and style
add_action('wp_enqueue_scripts', 'theme_styles_and_scripts');
//scripts and style for admin
add_action('admin_enqueue_scripts', 'admin_styles_and_scripts', 100);
//post type and tax
add_action('init', 'register_post_types');
//themes settings
add_action('after_setup_theme', 'setup_theme');
//remove admin panel
add_filter('show_admin_bar', '__return_false');
