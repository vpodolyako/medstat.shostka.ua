<?php

function setup_theme()
{
    //add thumbnails
    add_theme_support('post-thumbnails');
    add_theme_support('title-tag');
    add_theme_support('automatic-feed-links');

    //add primary menu
    register_nav_menus(array(
        'primary-menu' => __('Primary', 'Primary')
    ));

    //add settings page to admin panel
    if (function_exists('acf_add_options_page')) {

        if (function_exists('acf_add_options_page')) {

            $parent = acf_add_options_page(array(
                'title'         => 'ACC Site Settings',
                'menu_slug'     => 'theme-general-settings',
                'capability'    => 'manage_options',
            ));

            acf_add_options_sub_page(array(
                'page_title' => 'Footer and pagination setings',
                'menu_title' => 'Footer and pagination setings',
                'menu_slug'  => "options",
                'parent'     => $parent['menu_slug']
            ));


            if (isset($GLOBALS["polylang"])) {
                $langs = get_terms(array('taxonomy' => 'language', 'hide_empty' => false));
            }


            if (!empty($langs) && count($langs) > 0) {
                foreach ($langs as $lang) {
                    acf_add_options_sub_page(array(
                        'page_title' => 'Basic theme options (' . strtoupper($lang->slug) . ')',
                        'menu_title' => __('Basic theme options (' . strtoupper($lang->slug) . ')', 'acc'),
                        'menu_slug'  => "options-" . $lang->slug,
                        'post_id'    => $lang->slug,
                        'parent'     => $parent['menu_slug']
                    ));
                }
            }
        }
    }

    function register_my_custom_menu_page()
    {
        add_menu_page(
            'custom menu title',
            'Event managment',
            'manage_options',
            'custompage',
            'my_custom_menu_page',
            'dashicons-buddicons-groups',
            35
        );

        add_submenu_page('custompage', 'Orders', 'Orders', 'manage_options', 'orders', 'orders_menu_page');
    }

    function my_custom_menu_page()
    {
        get_template_part('partials/admin/events_managment_page');
    }

    function orders_menu_page()
    {
        get_template_part('partials/admin/orders_admin_page');
    }

    add_action('admin_menu', 'register_my_custom_menu_page');
}
