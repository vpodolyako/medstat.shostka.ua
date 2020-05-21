<?php

//register custom post_type and taxonomy

function register_post_types()
   {
      register_post_type(
        'blanks',
        array(
            'label'  => null,
            'labels' => array(
                'name'               => 'Blanks',
                'singular_name'      => 'Blanks',
                'add_new'            => 'Add new blank',
                'add_new_item'       => 'Add new blank',
                'edit_item'          => 'Edit',
                'new_item'           => 'Add new blank',
                'view_item'          => 'Viev blanks',
                'search_items'       => 'Search blanks',
                'not_found'          => 'Blanks not found',
                'not_found_in_trash' => 'Blanks not found',
                'parent_item_colon'  => '',
                'menu_name'          => 'Blanks'
            ),
            'has_archive'         => true,
            'public'              => true,
            'exclude_from_search' => true,
            'menu_icon'           => 'dashicons-buddicons-buddypress-logo',
            'show_in_menu'        => true,
            'menu_position'       => null,
            'supports'            => array('title', 'thumbnail', 'editor', 'author'),
        )
    );
   } 
        