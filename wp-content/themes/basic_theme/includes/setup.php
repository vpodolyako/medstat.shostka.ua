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

}
