<?php

//register custom post_type and taxonomy

function register_post_types()
{
    register_post_type(
        'companies',
        array(
            'label'  => null,
            'labels' => array(
                'name'               => 'Companies',
                'singular_name'      => 'Companies',
                'add_new'            => 'Add new companie',
                'add_new_item'       => 'Add new companie',
                'edit_item'          => 'Edit',
                'new_item'           => 'Add new companie',
                'view_item'          => 'Viev companies',
                'search_items'       => 'Search companies',
                'not_found'          => 'Companies not found',
                'not_found_in_trash' => 'Сompanies not found',
                'parent_item_colon'  => '',
                'menu_name'          => 'Сompanies'
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

    register_post_type(
        'partners',
        array(
            'label'  => null,
            'labels' => array(
                'name'               => 'Partners',
                'singular_name'      => 'Partners',
                'add_new'            => 'Add new partner',
                'add_new_item'       => 'Add new partner',
                'edit_item'          => 'Edit',
                'new_item'           => 'Add new partner',
                'view_item'          => 'Viev partners',
                'search_items'       => 'Search partners',
                'not_found'          => 'Partners not found',
                'not_found_in_trash' => 'Partners not found',
                'parent_item_colon'  => '',
                'menu_name'          => 'Partners'
            ),
            'has_archive'         => true,
            'public'              => true,
            'exclude_from_search' => true,
            'menu_icon'           => 'dashicons-groups',
            'show_in_menu'        => true,
            'menu_position'       => null,
            'supports'            => array('title', 'thumbnail', 'editor', 'author'),
        )
    );


    register_post_type(
        'serv-provider',
        array(
            'label'  => null,
            'labels' => array(
                'name'               => 'Service providers',
                'singular_name'      => 'Service providers',
                'add_new'            => 'Add new service provider',
                'add_new_item'       => 'Add new service provider',
                'edit_item'          => 'Edit',
                'new_item'           => 'Add new service provider',
                'view_item'          => 'Viev service providers',
                'search_items'       => 'Search service providers',
                'not_found'          => 'Service providers not found',
                'not_found_in_trash' => 'Service providers not found',
                'parent_item_colon'  => '',
                'menu_name'          => 'Service provider'
            ),
            'has_archive'         => true,
            'public'              => true,
            'exclude_from_search' => true,
            'menu_icon'           => 'dashicons-clipboard',
            'show_in_menu'        => true,
            'menu_position'       => null,
            'supports'            => array('title', 'thumbnail', 'editor', 'author', 'custom-fields'),
        )
    );

    register_post_type(
        'promotions',
        array(
            'label'  => null,
            'labels' => array(
                'name'               => 'Promotions',
                'singular_name'      => 'Promotions',
                'add_new'            => 'Add new promotion',
                'add_new_item'       => 'Add new promotion',
                'edit_item'          => 'Edit',
                'new_item'           => 'Add new promotion',
                'view_item'          => 'Viev promotions',
                'search_items'       => 'Search promotions',
                'not_found'          => 'Promotions not found',
                'not_found_in_trash' => 'Promotions not found',
                'parent_item_colon'  => '',
                'menu_name'          => 'Promotions'
            ),
            'has_archive'         => true,
            'public'              => true,
            'exclude_from_search' => true,
            'menu_icon'           => 'dashicons-tickets',
            'show_in_menu'        => true,
            'menu_position'       => null,
            'supports'            => array('title', 'thumbnail', 'editor', 'author'),
        )
    );

    register_post_type(
        'e_publication_type',
        array(
            'label'  => null,
            'labels' => array(
                'name'               => 'E-Publication Type',
                'singular_name'      => 'E-Publication Type',
                'add_new'            => 'Add new',
                'add_new_item'       => 'Add new',
                'edit_item'          => 'Edit',
                'new_item'           => 'Add new',
                'view_item'          => 'View',
                'search_items'       => 'Search',
                'not_found'          => 'not found',
                'not_found_in_trash' => 'not found',
                'parent_item_colon'  => '',
                'menu_name'          => 'E-Publication Type'
            ),
            'has_archive'         => true,
            'public'              => true,
            'exclude_from_search' => true,
            'menu_icon'           => 'dashicons-tickets',
            'show_in_menu'        => true,
            'menu_position'       => null,
            'supports'            => array('title'),
        )
    );


    register_post_type(
        'quotes',
        array(
            'label'  => null,
            'labels' => array(
                'name'               => 'Quotes',
                'singular_name'      => 'Quotes',
                'add_new'            => 'Add new quote',
                'add_new_item'       => 'Add new quote',
                'edit_item'          => 'Edit',
                'new_item'           => 'Add new quote',
                'view_item'          => 'Viev quotes',
                'search_items'       => 'Search quotes',
                'not_found'          => 'Quotes not found',
                'not_found_in_trash' => 'Quotes not found',
                'parent_item_colon'  => '',
                'menu_name'          => 'Quotes'
            ),
            'has_archive'         => true,
            'public'              => true,
            'exclude_from_search' => true,
            'menu_icon'           => 'dashicons-images-alt',
            'show_in_menu'        => true,
            'menu_position'       => null,
            'supports'            => array('title', 'thumbnail', 'editor', 'author'),
        )
    );


    register_post_type(
        'directions',
        array(
            'label'  => null,
            'labels' => array(
                'name'               => 'Directions',
                'singular_name'      => 'Directions',
                'add_new'            => 'Add new directions',
                'add_new_item'       => 'Add new directions',
                'edit_item'          => 'Edit',
                'new_item'           => 'Add new direction',
                'view_item'          => 'Viev directions',
                'search_items'       => 'Search directions',
                'not_found'          => 'Directions not found',
                'not_found_in_trash' => 'Directions not found',
                'parent_item_colon'  => '',
                'menu_name'          => 'Directions'
            ),
            'has_archive'         => true,
            'public'              => true,
            'exclude_from_search' => true,
            'taxonomies'          => array('work_sector'),
            'menu_icon'           => 'dashicons-randomize',
            'show_in_menu'        => true,
            'menu_position'       => null,
            'supports'            => array('title', 'thumbnail', 'editor', 'author'),
        )
    );


    register_post_type(
        'work_groups',
        array(
            'label'  => null,
            'labels' => array(
                'name'               => 'Work groups',
                'singular_name'      => 'Work groups',
                'add_new'            => 'Add new work group',
                'add_new_item'       => 'Add new work group',
                'edit_item'          => 'Edit',
                'new_item'           => 'Add new work group',
                'view_item'          => 'Viev work groups',
                'search_items'       => 'Search work groups',
                'not_found'          => 'Work groups not found',
                'not_found_in_trash' => 'Work groups not found',
                'parent_item_colon'  => '',
                'menu_name'          => 'Work groups'
            ),
            'has_archive'         => true,
            'public'              => true,
            'exclude_from_search' => true,
            'taxonomies' => array('work_sector'),
            'menu_icon'           => 'dashicons-networking',
            'show_in_menu'        => true,
            'menu_position'       => null,
            'supports'            => array('title', 'thumbnail', 'editor', 'author'),
        )
    );

    register_post_type(
        'clubs',
        array(
            'label'  => null,
            'labels' => array(
                'name'               => 'Clubs',
                'singular_name'      => 'Clubs',
                'add_new'            => 'Add new club',
                'add_new_item'       => 'Add new club',
                'edit_item'          => 'Edit',
                'new_item'           => 'Add new club',
                'view_item'          => 'Viev clubs',
                'search_items'       => 'Search clubs',
                'not_found'          => 'Clubs not found',
                'not_found_in_trash' => 'Clubs not found',
                'parent_item_colon'  => '',
                'menu_name'          => 'Clubs'
            ),
            'has_archive'         => true,
            'public'              => true,
            'exclude_from_search' => true,
            'menu_icon'           => 'dashicons-groups',
            'show_in_menu'        => true,
            'menu_position'       => null,
            'supports'            => array('title', 'thumbnail', 'editor', 'author'),
        )
    );


    register_post_type(
        'success_historys',
        array(
            'label'  => null,
            'labels' => array(
                'name'               => 'Success stories',
                'singular_name'      => 'Success stories',
                'add_new'            => 'Add new success story',
                'add_new_item'       => 'Add new success story',
                'edit_item'          => 'Edit',
                'new_item'           => 'Add new success story',
                'view_item'          => 'Viev success story',
                'search_items'       => 'Search success stories',
                'not_found'          => 'Success stories not found',
                'not_found_in_trash' => 'Success stories not found',
                'parent_item_colon'  => '',
                'menu_name'          => 'Success stories'
            ),
            'has_archive'         => true,
            'public'              => true,
            'exclude_from_search' => true,
            'menu_icon'           => 'dashicons-welcome-learn-more',
            'show_in_menu'        => true,
            'menu_position'       => null,
            'supports'            => array('title', 'thumbnail', 'editor', 'author'),
        )
    );

    register_post_type(
        'management_members',
        array(
            'label'  => null,
            'labels' => array(
                'name'               => 'Management',
                'singular_name'      => 'Management',
                'add_new'            => 'Add new manager',
                'add_new_item'       => 'Add new manager',
                'edit_item'          => 'Edit',
                'new_item'           => 'Add new manager',
                'view_item'          => 'Viev managers',
                'search_items'       => 'Search managers',
                'not_found'          => 'Manager not found',
                'not_found_in_trash' => 'Manager not found',
                'parent_item_colon'  => '',
                'menu_name'          => 'Management'
            ),
            'has_archive'         => true,
            'public'              => true,
            'exclude_from_search' => true,
            'taxonomies'          => array('manager_type'),
            'menu_icon'           => 'dashicons-buddicons-buddypress-logo',
            'show_in_menu'        => true,
            'menu_position'       => null,
            'supports'            => array('title', 'thumbnail', 'editor', 'author'),
        )
    );

    register_post_type(
        'events',
        array(
            'label'  => null,
            'labels' => array(
                'name'               => 'Events',
                'singular_name'      => 'Events',
                'add_new'            => 'Add new event',
                'add_new_item'       => 'Add new event',
                'edit_item'          => 'Edit',
                'new_item'           => 'Add new events',
                'view_item'          => 'Viev events',
                'search_items'       => 'Search events',
                'not_found'          => 'Events not found',
                'not_found_in_trash' => 'Events not found',
                'parent_item_colon'  => '',
                'menu_name'          => 'Events'
            ),
            'has_archive'         => true,
            'public'              => true,
            'exclude_from_search' => true,
            'menu_icon'           => 'dashicons-calendar-alt',
            'show_in_menu'        => true,
            'menu_position'       => null,
            'supports'            => array('title', 'thumbnail', 'editor', 'author'),
        )
    );

    register_taxonomy('event_types', array('events'), array(
        'label'                 => '',
        'labels'                => array(
            'name'              => 'Event types',
            'singular_name'     => 'Event type',
            'search_items'      => 'Пошук',
            'all_items'         => 'Все',
            'view_item '        => 'Переглянути',
            'parent_item'       => 'Надкатегорія',
            'parent_item_colon' => 'Надкатегорія:',
            'edit_item'         => 'Редагувати',
            'update_item'       => 'Обновити',
            'add_new_item'      => 'Додати',
            'new_item_name'     => 'Додати',
            'menu_name'         => 'Event types'
        ),
        'description'           => '',
        'public'                => true,
        'publicly_queryable'    => true,
        'show_in_nav_menus'     => true,
        'show_ui'               => true,
        'show_tagcloud'         => true,
        'show_in_rest'          => null,
        'rest_base'             => null,
        'hierarchical'          => true,
        'show_admin_column'     => true,
        'update_count_callback' => '',
        'rewrite'               => true,
        'capabilities'          => array(),
        'meta_box_cb'           => null,
        '_builtin'              => false,
        'show_in_quick_edit'    => 'post_categories_meta_box',
    ));

    register_post_type(
        'vacancies',
        array(
            'label'  => null,
            'labels' => array(
                'name'               => 'Vacancies',
                'singular_name'      => 'Vacancie',
                'add_new'            => 'Add new vacancie',
                'add_new_item'       => 'Add new vacancie',
                'edit_item'          => 'Edit',
                'new_item'           => 'Add new vacancie',
                'view_item'          => 'Viev vacancies',
                'search_items'       => 'Search vacancies',
                'not_found'          => 'Vacancies not found',
                'not_found_in_trash' => 'Vacancies not found',
                'parent_item_colon'  => '',
                'menu_name'          => 'Vacancies'
            ),
            'has_archive'         => true,
            'public'              => true,
            'exclude_from_search' => true,
            'menu_icon'           => 'dashicons-portfolio',
            'show_in_menu'        => true,
            'menu_position'       => null,
            'supports'            => array('title', 'thumbnail', 'editor', 'author'),
        )
    );

    register_post_type(
        'investment_successes',
        array(
            'label'  => null,
            'labels' => array(
                'name'               => 'Investment Successes',
                'singular_name'      => 'Investment Success',
                'add_new'            => 'Add new Investment Success',
                'add_new_item'       => 'Add new Investment Success',
                'edit_item'          => 'Edit',
                'new_item'           => 'Add new Investment Success',
                'view_item'          => 'Viev Investment Success',
                'search_items'       => 'Search Investment Success',
                'not_found'          => 'Investment Successes not found',
                'not_found_in_trash' => 'Investment Successes not found',
                'parent_item_colon'  => '',
                'menu_name'          => 'Investment Successes'
            ),
            'has_archive'         => true,
            'public'              => true,
            'exclude_from_search' => true,
            'menu_icon'           => 'dashicons-portfolio',
            'show_in_menu'        => true,
            'menu_position'       => null,
            'supports'            => array('title', 'thumbnail', 'editor', 'author'),
        )
    );

    

    // register_post_type(
    //     'vacancies_forms',
    //     array(
    //         'label'  => null,
    //         'labels' => array(
    //             'name'               => 'Vacancies_forms',
    //             'singular_name'      => 'Vacancies_form',
    //             'add_new'            => 'Add new vacancies forms',
    //             'add_new_item'       => 'Add new vacancies forms',
    //             'edit_item'          => 'Edit',
    //             'new_item'           => 'Add new vacancies form',
    //             'view_item'          => 'Viev vacancies forms',
    //             'search_items'       => 'Search vacancies forms',
    //             'not_found'          => 'Vacancies forms not found',
    //             'not_found_in_trash' => 'Vacancies forms not found',
    //             'parent_item_colon'  => '',
    //             'menu_name'          => 'Vacancies forms'
    //         ),
    //         'has_archive'         => true,
    //         'public'              => true,
    //         'exclude_from_search' => true,
    //         'menu_icon'           => 'dashicons-format-aside',
    //         'show_in_menu'        => true,
    //         'menu_position'       => null,
    //         'supports'            => array('title', 'thumbnail', 'editor', 'author'),
    //     )
    // );

    // register_post_type(
    //     'contacts_forms',
    //     array(
    //         'label'  => null,
    //         'labels' => array(
    //             'name'               => 'Contact forms',
    //             'singular_name'      => 'Contact form',
    //             'add_new'            => 'Add new contact forms',
    //             'add_new_item'       => 'Add new contact forms',
    //             'edit_item'          => 'Edit',
    //             'new_item'           => 'Add new contact form',
    //             'view_item'          => 'Viev contact forms',
    //             'search_items'       => 'Search contact forms',
    //             'not_found'          => 'Contact forms not found',
    //             'not_found_in_trash' => 'Contact forms not found',
    //             'parent_item_colon'  => '',
    //             'menu_name'          => 'Contact forms'
    //         ),
    //         'has_archive'         => true,
    //         'public'              => true,
    //         'exclude_from_search' => true,
    //         'menu_icon'           => 'dashicons-format-aside',
    //         'show_in_menu'        => true,
    //         'menu_position'       => null,
    //         'supports'            => array('title', 'thumbnail', 'editor', 'author'),
    //     )
    // );




    register_post_type(
        'news',
        array(
            'label'  => null,
            'labels' => array(
                'name'               => 'News',
                'singular_name'      => 'News',
                'add_new'            => 'Add new news',
                'add_new_item'       => 'Add new news',
                'edit_item'          => 'Edit',
                'new_item'           => 'Add new news',
                'view_item'          => 'Viev news',
                'search_items'       => 'Search news',
                'not_found'          => 'News not found',
                'not_found_in_trash' => 'News not found',
                'parent_item_colon'  => '',
                'menu_name'          => 'News'
            ),
            'has_archive'         => true,
            'public'              => true,
            'exclude_from_search' => true,
            'menu_icon'           => 'dashicons-text',
            'show_in_menu'        => true,
            'menu_position'       => null,
            'supports'            => array('title', 'thumbnail', 'editor', 'author'),
        )
    );


    register_post_type(
        'sponsors',
        array(
            'label'  => null,
            'labels' => array(
                'name'               => 'Sponsors',
                'singular_name'      => 'Sponsor',
                'add_new'            => 'Add new sponsor',
                'add_new_item'       => 'Add new sponsor',
                'edit_item'          => 'Edit',
                'new_item'           => 'Add new sponsor',
                'view_item'          => 'Viev sponsor',
                'search_items'       => 'Search sponsors',
                'not_found'          => 'Sponsors not found',
                'not_found_in_trash' => 'Sponsors not found',
                'parent_item_colon'  => '',
                'menu_name'          => 'Sponsors'
            ),
            'has_archive'         => true,
            'public'              => true,
            'exclude_from_search' => true,
            'menu_icon'           => 'dashicons-businessman',
            'show_in_menu'        => true,
            'menu_position'       => null,
            'supports'            => array('title', 'thumbnail', 'editor', 'author'),
        )
    );

    register_taxonomy('news_type', array('news'), array(
        'label'                 => '',
        'labels'                => array(
            'name'              => 'News type',
            'singular_name'     => 'News type',
            'search_items'      => 'Search',
            'all_items'         => 'All',
            'view_item '        => 'Show',
            'parent_item'       => 'Subcategrie',
            'parent_item_colon' => 'Subcategorie:',
            'edit_item'         => 'Edit',
            'update_item'       => 'Update',
            'add_new_item'      => 'Add',
            'new_item_name'     => 'Add',
            'menu_name'         => 'News type'
        ),
        'description'           => '',
        'public'                => true,
        'publicly_queryable'    => true,
        'show_in_nav_menus'     => true,
        'show_ui'               => true,
        'show_tagcloud'         => true,
        'show_in_rest'          => null,
        'rest_base'             => null,
        'hierarchical'          => true,
        'show_admin_column'     => true,
        'update_count_callback' => '',
        'rewrite'               => true,
        'capabilities'          => array(),
        'meta_box_cb'           => null,
        '_builtin'              => false,
        'show_in_quick_edit'    => 'post_categories_meta_box',
    ));


    register_taxonomy('news_type', array('news'), array(
        'label'                 => '',
        'labels'                => array(
            'name'              => 'News type',
            'singular_name'     => 'News type',
            'search_items'      => 'Search',
            'all_items'         => 'All',
            'view_item '        => 'Show',
            'parent_item'       => 'Subcategrie',
            'parent_item_colon' => 'Subcategorie:',
            'edit_item'         => 'Edit',
            'update_item'       => 'Update',
            'add_new_item'      => 'Add',
            'new_item_name'     => 'Add',
            'menu_name'         => 'News type'
        ),
        'description'           => '',
        'public'                => true,
        'publicly_queryable'    => true,
        'show_in_nav_menus'     => true,
        'show_ui'               => true,
        'show_tagcloud'         => true,
        'show_in_rest'          => null,
        'rest_base'             => null,
        'hierarchical'          => true,
        'show_admin_column'     => true,
        'update_count_callback' => '',
        'rewrite'               => true,
        'capabilities'          => array(),
        'meta_box_cb'           => null,
        '_builtin'              => false,
        'show_in_quick_edit'    => 'post_categories_meta_box',
    ));

    register_taxonomy('companie_industry', array('companies'), array(
        'label'                 => '',
        'labels'                => array(
            'name'              => 'Companie industry',
            'singular_name'     => 'Companie industry',
            'search_items'      => 'Search',
            'all_items'         => 'All',
            'view_item '        => 'Show',
            'parent_item'       => 'Subcategrie',
            'parent_item_colon' => 'Subcategorie:',
            'edit_item'         => 'Edit',
            'update_item'       => 'Update',
            'add_new_item'      => 'Add',
            'new_item_name'     => 'Add',
            'menu_name'         => 'Companie industry'
        ),
        'description'           => '',
        'public'                => true,
        'publicly_queryable'    => true,
        'show_in_nav_menus'     => true,
        'show_ui'               => true,
        'show_tagcloud'         => true,
        'show_in_rest'          => null,
        'rest_base'             => null,
        'hierarchical'          => true,
        'show_admin_column'     => true,
        'update_count_callback' => '',
        'rewrite'               => true,
        'capabilities'          => array(),
        'meta_box_cb'           => null,
        '_builtin'              => false,
        'show_in_quick_edit'    => 'post_categories_meta_box',
    ));

    register_taxonomy_for_object_type('post', 'work_sector');
}
