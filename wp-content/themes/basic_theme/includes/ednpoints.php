<?php


/**
 * Function for user login to the site
 */
function loginUser_acc()
{
    global $cur_lang;
    $auth = wp_authenticate(sanitize_text_field($_POST['email']), sanitize_text_field($_POST['password']));

    if (is_wp_error($auth)) {
        if (empty($_POST['email'])) { } else {
            if ($auth->{'errors'}{
                'invalid_email'}[0]) {
                $result['email'] = pll__('Invalid email or login address');
            }

            if ($auth->{'errors'}{
                'invalid_username'}[0]) {
                $result['email'] = pll__('Invalid email or login address');
            }
        }

        if (empty($_POST['password'])) {
            $result['password'] = pll__('Password is empty');
        } else {
            if ($auth->{'errors'}{
                'incorrect_password'}[0]) {
                $result['password'] = pll__('Date is incorect');
            }
        }

        $result['error'] = $auth;

        wp_send_json($result);
    } else {
        nocache_headers();
        wp_clear_auth_cookie();
        wp_set_auth_cookie($auth->ID);
        $result['done'] = true;
    }

    wp_send_json($result);
}

add_action('wp_ajax_loginUser_acc', 'loginUser_acc');
add_action('wp_ajax_nopriv_loginUser_acc', 'loginUser_acc');


/**
 * Function for сreating a new user on the site
 */
function register_user_acc()
{
    $guid = getGUID();

    $fields = [
        'accountid'             => 'field_5db9b74ce9416',
        'acc_salutationnew'     => 'field_5dd66e8707b89',
        'birthdate'             => 'field_5dc5a2c280c5c',
        'jobtitle'              => 'field_5dc5a30680c5d',
        'mobilephone'           => 'field_5dc5a2b780c5b',
        'emailaddress1'         => 'field_5dfa47dde7101',
        'statecode'             => 'field_5dc9a80c4458a',
        'avatar'                => 'field_5dfba765558f7',
        'gdrp'                  => 'field_5dfa226f26480',
        'company'               => 'field_5dd67c98ef90a',
        'company_name'          => 'field_5e01f74ac4056'
    ];

    if (!($_POST['user_pass'] && $_POST['user_pass'] == $_POST['user_pass_confirm'] && is_email($_POST['email']))) {
        $result['erorrs'] = 'true';

        if (!is_email($_POST['email'])) {
            $result['email'] = pll__('Email address is incorrect!');
        }

        if (!isset($_POST['user_pass'])) {
            $result['user_pass'] = pll__('The password is required');
        }

        if ($_POST['user_pass'] != $_POST['user_pass_confirm']) {
            $result['confirm_password'] = pll__('Passwords do not match');
        }

        wp_send_json($result);
    }

    $result['erorrs'] = 'false';

    $email      = sanitize_text_field($_POST['email']);

    $userdata = [
        'user_pass'       => sanitize_text_field($_POST['password']),
        'user_login'      => $email,
        'user_email'      => $email,
        'nickname'        => sanitize_text_field($email),
        'first_name'      => sanitize_text_field($_POST['first_name']),
        'last_name'       => sanitize_text_field($_POST['last_name'])
    ];

    $user_id = wp_insert_user($userdata);

    $result['user'] = $userdata;

    $result['wp_erorrs'] = $user_id;

    if (is_wp_error($user_id)) {
        if ($user_id->errors['existing_user_email'][0] || $user_id->errors['existing_user_login'][0]) {
            $result['email'] = pll__('Sorry, that e-mail already exists!');
        }

        wp_send_json($result);
    }

    $user_id_mod = 'user_' .  $user_id;

    update_field($fields['accountid'],  $guid, $user_id_mod);
    update_field($fields['acc_salutationnew'],  $_POST['salutation'], $user_id_mod);
    update_field($fields['birthdate'],  $_POST['birthday'], $user_id_mod);
    update_field($fields['jobtitle'],  $_POST['position'], $user_id_mod);
    update_field($fields['mobilephone'],  $_POST['phone'], $user_id_mod);
    update_field($fields['emailaddress1'],  $_POST['email'], $user_id_mod);
    update_field($fields['gdrp'],  $_POST['gdrp'], $user_id_mod);
    if (isset($_POST['companies'])) {
        $company_guid = get_field('guid' . (int) $_POST['companies']);
        update_field($fields['company'],  $_POST['companies'], $company_guid);
    }
    if (isset($_POST['company_name'])) {
        update_field($fields['company_name'],  $_POST['company_name'], $user_id_mod);
    }

    $result['done'] = 'complete';

    wp_clear_auth_cookie();
    wp_set_auth_cookie($user_id);

    wp_send_json($result);
}
add_action('wp_ajax_nopriv_register_user_acc', 'register_user_acc');


/**
 * Function for user logout on the site
 */
function logOutUser()
{
    wp_logout();
    wp_send_json('done');
}

add_action('wp_ajax_logOutUser', 'logOutUser');


/**
 * Function for check user and send a letter to the mail when recovering a password
 */
function checkUser()
{
    if (empty($_POST['email'])) {
        $result['email'] = pll__('Please enter an email or phone');
        wp_send_json($result);
    } else {
        $user = get_user_by('email', $_POST['email']);

        if ($user) {
            $result['complete'] = true;
            $result['user'] = true;
            $result['login'] = $user->user_login;
            $key = get_password_reset_key($user);

            $subject = pll__('Password recovery');

            $message = '<p>' . pll__('Hello') . $user->first_name . ',<br/>'
                . pll__('You have requested a password reset') . '<br/>'
                . '<a href="' . get_permalink(pll_get_post(75)) . '?key_reset=' . $key . '&login=' . $user->user_login . '"><button>' . pll__('Recover password')  . '</a></button><br/>'
                . pll__('This link and key will only work for 24 hours') . '.<br/>'
                . pll__('Thank you') . '</p>';


            $mailto = $_POST['email'];

            $headers  = 'From: ' . get_bloginfo('name') . ' <no-reply@' . $_SERVER['HTTP_HOST'] . '>' . "\r\n" .
                'Reply-To: ' . get_bloginfo('name') . ' <no-reply@' . $_SERVER['HTTP_HOST'] . '>' . "\r\n" . "Content-type: text/html; charset=utf-8 \r\n";


            if (wp_mail($mailto, $subject, $message, $headers)) {
                $result['email_status'] = true;
                $result['done'] = pll__('Letter to recover your password sent to you by mail');
            } else {
                $result['email'] = pll__('Please enter an email or phone');
                $result['error'] = pll__('No such user exists');
            }
        } else {
            $result['email'] = pll__('No such user exists');
        }

        wp_send_json($result);
    }
}

add_action('wp_ajax_checkUser', 'checkUser');
add_action('wp_ajax_nopriv_checkUser', 'checkUser');


/**
 * Function for set new password for the user
 */
function setNewPassword()
{
    global $cur_lang;

    if (empty($_POST['password']) && empty($_POST['confirm_password'])) {
        if (empty($_POST['password'])) {
            $result['password'] = pll__('Password is empty');
        }

        if (empty($_POST['confirm_password'])) {
            $result['confirm_password'] = pll__('Password confirm is empty');
        }
    } else {
        if ($_POST['confirm_password'] != $_POST['password']) {
            $result['password'] = pll__('Passwords do not match');
            $result['confirm_password'] = pll__('Passwords do not match');
        } else {
            $result['done'] = pll__('Your password was successfully changed');
            $result['redirect'] = get_permalink(pll_get_post(67));
            wp_set_password($_POST['password'], (int) $_POST['user_id']);
        }
    }

    wp_send_json($result);
}

add_action('wp_ajax_setNewPassword', 'setNewPassword');
add_action('wp_ajax_nopriv_setNewPassword', 'setNewPassword');



/**
 * Function for filter promotions by company industry
 */
function promotionFilter()
{
    $filter_companies_list = new WP_Query(array(
        'post_type'            => 'promotions',
        'posts_per_page' => -1,
        'paged' => get_query_var('paged') ?: 1,
    ));

    foreach ($filter_companies_list->posts as $comapnie) {
        $companies_logo = get_the_post_thumbnail_url($comapnie->ID);
        $comapnie->link = get_permalink($comapnie->ID);
        $comapnie->logo = $companies_logo;
        $comapnie->companie_refered = get_field('companies_that_this_promotion_refers_to', $comapnie->ID);
        $comapnie->companie_refered_logo = get_the_post_thumbnail_url($comapnie->companie_refered->ID);
    }
    $all_promotions = new WP_Query(array(
        'post_type'            => 'promotions',
        'posts_per_page' => -1,
        'paged' => get_query_var('paged') ?: 1,
    ));

    if ($all_promotions) {
        foreach ($all_promotions->posts as $promotion) {
            $refered_company = get_field('companies_that_this_promotion_refers_to', $promotion->ID);
            $company_industry = get_the_terms($refered_company->ID, 'companie_industry');
            // if($refered_company == )
            $promotion->industry = $company_industry;
            // $promotion->link = get_permalink($promotion->ID);
            // $promotion->logo = $companies_logo;
        }
    }
    $resp = array(
        'result' => $filter_companies_list->posts,
    );

    wp_send_json($resp);
}

add_action('wp_ajax_promotionFilter', 'promotionFilter');
add_action('wp_ajax_nopriv_promotionFilter', 'promotionFilter');


/**
 * Function for returns posts when requesting pagination
 */
function get_pagination_posts()
{
    global $cur_lang;
    $output = '';
    $page_id = $_POST['pageid'];
    $page_total = $_POST['page_total'];

    $resp = array();

    $args['posts_per_page'] = $_POST['count_items'];


    if ($_POST['post_type'] == 'stories') {
        $args['post_type'] = 'success_historys';

        if ($page_id > 0) {
            $args['offset'] = ($_POST['count_items'] * $page_id);
        }

        $aboutPosts = new WP_Query($args);
        if ($aboutPosts->have_posts()) {

            ob_start();


            while ($aboutPosts->have_posts()) : $aboutPosts->the_post();
                $output .= get_template_part('partials/success_stories/item_another');
            endwhile;

            $data = ob_get_clean();
        }
    }

    if ($_POST['post_type'] == 'news') {
        $args['post_type'] = 'news';

        $args['tax_query'] = [
            'relation ' => 'AND',
            [
                'taxonomy' => 'news_type',
                'field' => 'term_id',
                'terms' => [get_field('current_news_term', $cur_lang)]
            ]
        ];

        $args['meta_query'] = [
            [
                'key' => 'relation_companies',
                'compare' => '=',
                'value' => null
            ]
        ];

        if ($page_id > 0) {
            $args['offset'] = ($_POST['count_items'] * $page_id);
        }

        $aboutPosts = new WP_Query($args);
        if ($aboutPosts->have_posts()) {

            ob_start();

            while ($aboutPosts->have_posts()) : $aboutPosts->the_post();
                $output .= get_template_part('partials/news/ajax_item');
            endwhile;

            $data = ob_get_clean();
        }
    }

    if ($_POST['post_type'] == 'speeches') {
        $args['post_type'] = 'news';

        $args['tax_query'] = [
            'relation ' => 'AND',
            [
                'taxonomy' => 'news_type',
                'field' => 'term_id',
                'terms' => [get_field('current_speech_term', $cur_lang)]
            ]
        ];

        if ($page_id > 0) {
            $args['offset'] = ($_POST['count_items'] * $page_id);
        }

        $aboutPosts = new WP_Query($args);
        if ($aboutPosts->have_posts()) {

            ob_start();

            while ($aboutPosts->have_posts()) : $aboutPosts->the_post();
                $output .= get_template_part('partials/news/ajax_item');
            endwhile;

            $data = ob_get_clean();
        }
    }

    if ($_POST['post_type'] == 'publication') {
        $args['post_type'] = 'news';

        $args['tax_query'] = [
            'relation ' => 'AND',
            [
                'taxonomy' => 'news_type',
                'field' => 'term_id',
                'terms' => [get_field('current_publication_category', $cur_lang)]
            ]
        ];

        if ($page_id > 0) {
            $args['offset'] = ($_POST['count_items'] * $page_id);
        }

        $aboutPosts = new WP_Query($args);
        if ($aboutPosts->have_posts()) {

            ob_start();

            while ($aboutPosts->have_posts()) : $aboutPosts->the_post();
                $output .= get_template_part('partials/news/ajax_item');
            endwhile;

            $data = ob_get_clean();
        }
    }

    if ($_POST['post_type'] == 'expert_materials') {
        $args['post_type'] = 'news';

        $args['tax_query'] = [
            'relation ' => 'AND',
            [
                'taxonomy' => 'news_type',
                'field' => 'term_id',
                'terms' => [get_field('current_expert_material_category', $cur_lang)]
            ]
        ];

        if ($page_id > 0) {
            $args['offset'] = ($_POST['count_items'] * $page_id);
        }

        $aboutPosts = new WP_Query($args);
        if ($aboutPosts->have_posts()) {

            ob_start();

            while ($aboutPosts->have_posts()) : $aboutPosts->the_post();
                $output .= get_template_part('partials/news/ajax_item');
            endwhile;

            $data = ob_get_clean();
        }
    }

    if ($_POST['post_type'] == 'company') {

        if ($page_id > 0) {
            $args['offset'] = ($_POST['count_items'] * $page_id);
        }

        if ($_POST['companie_id']) {
            $args['post_type'] = 'news';

            $args['tax_query'] = [
                [
                    'taxonomy' => 'news_type',
                    'field' => 'term_id',
                    'terms' => [get_field('current_news_term', $cur_lang)]
                ]
            ];

            $args['meta_query'] = [
                [
                    'key' => 'relation_companies',
                    'compare' => '=',
                    'value' => $_POST['companie_id']
                ]
            ];

            $aboutPosts = new WP_Query($args);
            if ($aboutPosts->have_posts()) {

                ob_start();

                while ($aboutPosts->have_posts()) : $aboutPosts->the_post();
                    $output .= get_template_part('partials/news/ajax_item_three');
                endwhile;

                $data = ob_get_clean();
            }
        } else {
            $args['post_type'] = 'companies';

            $aboutPosts = new WP_Query($args);
            if ($aboutPosts->have_posts()) {
                ob_start();
                while ($aboutPosts->have_posts()) : $aboutPosts->the_post();
                    $output .= get_template_part('partials/news/ajax_item_two');
                endwhile;

                $data = ob_get_clean();
            }
        }
    }


    if ($_POST['post_type'] == 'vacancies') {
        $args['post_type'] = 'vacancies';

        if ($page_id > 0) {
            $args['offset'] = ($_POST['count_items'] * $page_id);
        }

        $aboutPosts = new WP_Query($args);

        global $single_vacancy;
        if ($aboutPosts->posts) {
            foreach ($aboutPosts->posts as $single_vacancy) {
                ob_start();
                $output .= get_template_part('partials/vacancies/item');
                $data = ob_get_clean();
            }
            wp_reset_postdata();
        }
    }

    if ($_POST['post_type'] == 'companies') {
        $args['post_type'] = 'companies';

        $args['order'] = $_POST['order'];
        $args['orderby'] = 'title';

        if ($_POST['filtered_field'] == 'all') {
            $args['tax_query'] = '';
        } else {
            if ($_POST['filtered_field']) {
                $args['tax_query'] = [
                    'relation ' => 'AND',
                    [
                        'taxonomy' => 'companie_industry',
                        'field' => 'term_id',
                        'terms' => $_POST['filtered_field']
                    ]
                ];
            }
        }



        if ($page_id > 0) {
            $args['offset'] = ($_POST['count_items'] * $page_id);
        }

        $aboutPosts = new WP_Query($args);


        global $company_with_button;


        foreach ($aboutPosts->posts as $comapnie) {
            $companies_logo = get_the_post_thumbnail_url($comapnie->ID);
            $comapnie->link = get_permalink($comapnie->ID);
            $comapnie->logo = $companies_logo;
        }



        $resp['companies'] = $aboutPosts->posts;
        $resp['order'] =  $_POST['order'];
        $resp['filter'] =  $_POST['filtered_field'];
        $resp['offset'] =  $args['offset'];
        set_query_var('pagination_list', $aboutPosts);
    }

    if ($_POST['post_type'] == 'partners') {
        $args['post_type'] = 'partners';

        $args['order'] = $_POST['order'];
        $args['orderby'] = 'title';

        if ($page_id > 0) {
            $args['offset'] = ($_POST['count_items'] * $page_id);
        }

        $aboutPosts = new WP_Query($args);


        global $company_with_button;


        foreach ($aboutPosts->posts as $comapnie) {
            $companies_logo = get_the_post_thumbnail_url($comapnie->ID);
            $comapnie->link = get_permalink($comapnie->ID);
            $comapnie->logo = $companies_logo;
        }


        $resp['partners'] = $aboutPosts->posts;

        // if($aboutPosts->posts){
        //     foreach(  $aboutPosts->posts as $company_with_button ){
        //         ob_start(); 
        //         $output .= get_template_part('partials/general/company_pagination');
        //         $data = ob_get_clean();

        //     }
        //     wp_reset_postdata();
        // }
    }

    if ($_POST['post_type'] == 'promotions') {
        $args['post_type'] = 'promotions';

        if ($page_id > 0) {
            $offset = ($_POST['count_items'] * $page_id);
        }

        if ($_POST['filtered_field'] == 'all') {
            $all_promotions = new WP_Query(array(
                'post_type'            => 'companies',
                'posts_per_page' => -1,
                'paged' => get_query_var('paged') ?: 1,
                'fields' => 'ids'
            ));
        } else {
            $all_promotions = new WP_Query(array(
                'post_type'            => 'companies',
                'posts_per_page' =>-1,
                'paged' => get_query_var('paged') ?: 1,
                'fields' => 'ids',
                'tax_query'    => [
                    [
                        'taxonomy' => 'companie_industry',
                        'field' => 'term_id',
                        'terms' => $_POST['filtered_field']
                    ]
                ]                        
            ));
        }

        $aboutPosts = new WP_Query(array(
            'post_type'            => 'promotions',
            'meta_query' => [
                [
                    'key' => 'companies_that_this_promotion_refers_to',
                    'compare' => 'IN',
                    'value' => $all_promotions->posts 
                ]
            ],
            'posts_per_page' => intval($_POST['count_items']),
            'offset' => $offset,
            'paged' => get_query_var('paged') ?: 1,
        ));
    
    
        if ($aboutPosts->posts) {
            foreach ($aboutPosts->posts as $promotion) {
                $refered_company = get_field('companies_that_this_promotion_refers_to', $promotion->ID);
                $company_industry = get_the_terms($refered_company->ID, 'companie_industry');
                $promotion->industry = $company_industry[0]->term_id;
                $promotion->companie_refered =  $refered_company;
                $promotion->logo = get_the_post_thumbnail_url($promotion->ID);
                $promotion->companie_refered_logo = get_the_post_thumbnail_url($refered_company->ID);
            }
        }

        if ($aboutPosts->have_posts()) {
            ob_start();

            if($aboutPosts->posts){
                while ($aboutPosts->have_posts()) : $aboutPosts->the_post();
                    $output .= get_template_part('partials/general/post_with_logo_another');
                endwhile;
            }

            $data = ob_get_clean();
        }
    }


    if ($_POST['post_type'] == 'investment_successes') {
        $args['post_type'] = 'investment_successes';

        if ($page_id > 0) {
            $args['offset'] = ($_POST['count_items'] * $page_id);
        }

        $aboutPosts = new WP_Query($args);
        if ($aboutPosts->have_posts()) {

            ob_start();


            while ($aboutPosts->have_posts()) : $aboutPosts->the_post();
                $output .= get_template_part('partials/investment_successes/item_ajax');
            endwhile;

            $data = ob_get_clean();
        }
    }

    if($_POST['post_type'] == 'events'){
        $args['post_type'] = 'events';

        if ($page_id > 0) {
            $args['offset'] = ($_POST['count_items'] * $page_id);
        }

        $args['tax_query'] = [
            [
                'taxonomy' => 'event_types',
                'field' => 'term_id',
                'terms' => [$_POST['event_types']]
            ]

            
        ];
        
        $args['order'] = 'ASC';

        $today = date('Y-m-d');
        if($_POST['event_filter'] == 'past'){
            $args['meta_query'] = [
                [                
                    'key'       => 'start_date_time',
                    'value'     => $today,
                    'type'      => 'DATE',
                    'compare'   => '<',
                ]
            ];
        }
        else{
            $args['meta_query'] = [
                [                
                    'key'       => 'start_date_time',
                    'value'     => $today,
                    'type'      => 'DATE',
                    'compare'   => '>=',
                ]
            ];
        }




        $aboutPosts = new WP_Query($args);
        if ($aboutPosts->have_posts()) {

            ob_start();

            while ($aboutPosts->have_posts()) : $aboutPosts->the_post();
                $output .= get_template_part('partials/general/event-ajax');
            endwhile;

            $data = ob_get_clean();
        }
    }


    $resp['success'] = true;
    $resp['output'] = $data;
    $resp['posts'] = $aboutPosts->posts;


    wp_send_json($resp);
}

add_action('wp_ajax_nopriv_get_pagination_posts', 'get_pagination_posts'); //witout logged in
add_action("wp_ajax_get_pagination_posts", "get_pagination_posts");           //logged in


/**
 * Function for sent to mail  information about new vacancie request 
 */
function saveVacancyForm()
{
    global $cur_lang;

    $uploadedfile = $_FILES['vac_file'];

    $upload_overrides = array('test_form' => false);

    $movefile = wp_handle_upload($uploadedfile, $upload_overrides);

    if ($movefile && !isset($movefile['error'])) {
        $movefile['url'];
    }

    $attachments = array($movefile['file']);

    $message = pll__('You have new resumy for vacancy') .  ': ' . $_POST['vacancy_name'] . '.</h2>'
        . '<p><b>' . pll__('User name') . ': </b>' . $_POST['vac_name'] . ' <p>'
        . '<p><b>' . pll__('User last name') . ' : </b>' . $_POST['vac_last'] . '<p>'
        . '<p><b>' . pll__('User e-mail') . ' : </b>' . $_POST['vac_email'] . '<p>'
        . '<p><b>' . pll__('User phone') . '  : </b>' . $_POST['vac_phone'] . '<p>'
        . '<p><b>' . pll__('User short description') . '  : </b> ' . $_POST['vac_decsription'] . '<p>';


    $subject = pll__('New job resumes for :') . $_POST['vacancy_name'] . '.';
    $mailto = 'vacancies@chamber.ua';

    $headers  = 'From: ' . get_bloginfo('name') . ' <no-reply@' . $_SERVER['HTTP_HOST'] . '>' . "\r\n" .
        'Reply-To: ' . get_bloginfo('name') . ' <no-reply@' . $_SERVER['HTTP_HOST'] . '>' . "\r\n" . "Content-type: text/html; charset=utf-8 \r\n";

    $email_result = wp_mail($mailto, $subject, $message, $headers, $attachments);

    $resp = array(
        'success' => true,
        'email_result' => $email_result,
        'file' => $_FILES['vac_file'],
        'attaches' => $attachments,
        'movefile' =>  $movefile,
    );

    wp_send_json($resp);
}

add_action('wp_ajax_nopriv_saveVacancyForm', 'saveVacancyForm'); //witout logged in
add_action("wp_ajax_saveVacancyForm", "saveVacancyForm");

/**
 * Function for sent to mail  information about new feedback request 
 */
function saveFeedbackForm()
{
    global $cur_lang;

    $message = '<h2>' . pll__('You have new feebback request') . '</h2>'
        . '<p><b>' . pll__('User name') . ': </b>' . $_POST['cont_name'] . ' <p>'
        . '<p><b>' . pll__('User phone') . ': </b>' . $_POST['cont_phone'] . '<p>'
        . '<p><b>' . pll__('User e-mail') . ': </b>' . $_POST['cont_email'] . '<p>'
        . '<p><b>' . pll__('User theme') . ' : </b>' . $_POST['cont_theme'] . '<p>'
        . '<p><b>' . pll__('User message') . ' : </b>' . $_POST['cont_message'] . '<p>';

    $subject = pll__('New feedback');
    $mailto = 'chamber@chamber.ua';
    $headers  = 'From: ' . get_bloginfo('name') . ' <no-reply@' . $_SERVER['HTTP_HOST'] . '>' . "\r\n" .
        'Reply-To: ' . get_bloginfo('name') . ' <no-reply@' . $_SERVER['HTTP_HOST'] . '>' . "\r\n" . "Content-type: text/html; charset=utf-8 \r\n";

    $email_result = wp_mail($mailto, $subject, $message, $headers);

    $resp = array(
        'success' => true,
        'email_result' => $email_result
    );

    wp_send_json($resp);
}

add_action('wp_ajax_nopriv_saveFeedbackForm', 'saveFeedbackForm'); //witout logged in
add_action("wp_ajax_saveFeedbackForm", "saveFeedbackForm");


/**
 * Function for get companies list and links of region, when we click on map
 */
function getRegionCompanies()
{

    global $cur_lang;

    $region_companies_list = new WP_Query(array(
        'post_type'            => 'companies',
        'posts_per_page' => -1,
        'paged' => get_query_var('paged') ?: 1,
        'meta_query' => [
            [
                'key' => 'region_to_refer',
                'compare' => '=',
                'value' => $_GET['region']
            ]
        ]
    ));

    $regions_list = array(
        "zhytomyr-region" => array(
            "title" => pll__('Zhytomyr region'),
            "companiesTitle" => pll__('The ACC companies in the Zhytomyr region')
        ),
        "kyiv-region" => array(
            "title" => pll__('Kiev region'),
            "companiesTitle" => pll__('The ACC companies in the Kiev region'),
        ),
        "poltava-region" => array(
            "title" => pll__('Poltava region'),
            "companiesTitle" => pll__('The ACC companies in the Poltava region'),
        ),
        "chernihiv-region" => array(
            "title" => pll__('Chernihiv region'),
            "companiesTitle" => pll__('The ACC companies in the Chernihiv region'),
        ),
        "zaporizhia-region" => array(
            "title" => pll__('Zaporozhye region'),
            "companiesTitle" => pll__('The ACC companies in the Zaporozhye region'),
        ),
        "zakarpattia-region" => array(
            "title" => pll__('Transcarpathian region'),
            "companiesTitle" => pll__('The ACC companies in the Zakarpattia region'),
        ),
        "volyn-region" => array(
            "title" => pll__('Volyn region'),
            "companiesTitle" => pll__('The ACC companies in the the Volyn region'),
        ),
        "vinnytsia-region" => array(
            "title" => pll__('Vinnytsia region'),
            "companiesTitle" => pll__('The ACC companies in the Vinnitsa region'),
        ),
        "odesa-region" => array(
            "title" => pll__('Odessa region'),
            "companiesTitle" => pll__('The ACC companies in the Odessa region'),
        ),
        "mykolaiv-region" => array(
            "title" => pll__('Mykolaiv region'),
            "companiesTitle" => pll__('The ACC companies in the Mykolaiv region'),
        ),
        "lviv-region" => array(
            "title" => pll__('Lviv region'),
            "companiesTitle" => pll__('The ACC companies in the Lviv region'),
        ),
        "luhansk-region" => array(
            "title" => pll__('Lugansk region'),
            "companiesTitle" => pll__('The ACC companies in the Lugansk region'),
        ),
        "kirovohrad-region" => array(
            "title" => pll__('Kirovograd region'),
            "companiesTitle" => pll__('The ACC companies in the Kirovohrad region'),
        ),
        "khmelnytskyi-region" => array(
            "title" => pll__('Khmelnytsky region'),
            "companiesTitle" => pll__('The ACC companies in the Khmelnitsky region'),
        ),
        "kherson-region" => array(
            "title" => pll__('Kherson region'),
            "companiesTitle" => pll__('The ACC companies in the Kherson region'),
        ),

        "kharkiv-region" => array(
            "title" => pll__('Kharkiv region'),
            "companiesTitle" => pll__('The ACC companies in the Kharkiv region'),
        ),
        "ivano-frankivsk-region" => array(
            "title" => pll__('Ivano-Frankivsk region'),
            "companiesTitle" => pll__('The ACC companies in the Ivano-Frankivsk region'),
        ),
        "donetsk-region" => array(
            "title" => pll__('Donetsk region'),
            "companiesTitle" => pll__('The ACC companies in the Donetsk region'),
        ),
        "dnipropetrovsk-region" => array(
            "title" => pll__('Dnipropetrovsk region'),
            "companiesTitle" => pll__('The ACC companies in the Dnepropetrovsk region'),
        ),
        "crimea" => array(
            "title" => pll__('Crimean region'),
            "companiesTitle" => pll__('The ACC companies in the Crimean region'),
        ),

        "chernivtsi-region" => array(
            "title" => pll__('Chernivtsi region'),
            "companiesTitle" => pll__('The ACC companies in the Chernivtsi region'),
        ),
        "cherkasy-region" => array(
            "title" => pll__('Cherkasy region'),
            "companiesTitle" => pll__('The ACC companies in the Cherkasy region'),
        ),
        "ternopil-region" => array(
            "title" => pll__('Ternopil region'),
            "companiesTitle" => pll__('The ACC companies in the Ternopil region'),
        ),
        "sumy-region" => array(
            "title" => pll__('Sumy region'),
            "companiesTitle" => pll__('The ACC companies in the Sumy region'),
        ),
        "rivne-region" => array(
            "title" => pll__('Rivne region'),
            "companiesTitle" => pll__('The ACC companies in the Rivne region'),
        ),
    );

    $region_companies_list_all = $region_companies_list->posts;

    foreach ($region_companies_list_all as $comapnie) {
        $companies_logo = get_the_post_thumbnail_url($comapnie->ID);
        $comapnie->compnie_logo = $companies_logo;
        $comapnie->link = get_permalink($comapnie->ID);
    }

    $region_lang = $regions_list[$_GET['region']];
    $allText = pll__('All companies in the region');
    $allEmptyText = pll__('There are no companies in the selected area') . '.';
    $all_regions = get_field('links_for_regions', $_GET['page_id']);
    $curent_region = $_GET['region'];

    $resp = array(
        'companies' => $region_companies_list_all,
        '$all_regions' =>  $all_regions,
        'region_link' => $all_regions[$curent_region],
        'region' => $_GET['region'],
        'region_data' => $region_lang,
        'allText' => $allText,
        'allEmptyText' => $allEmptyText,
    );

    wp_send_json($resp);
}

add_action('wp_ajax_nopriv_getRegionCompanies', 'getRegionCompanies'); //witout logged in
add_action("wp_ajax_getRegionCompanies", "getRegionCompanies");


/**
 * Function for sorting parthners by name 
 */
function PartnersSort()
{
    $filter_companies_list = new WP_Query(array(
        'post_type'            => 'partners',
        'posts_per_page' => $_POST['count'],
        'paged' => get_query_var('paged') ?: 1,
        'order' => $_POST['sort_field'],
        'orderby' => 'title'
    ));

    foreach ($filter_companies_list->posts as $comapnie) {
        $companies_logo = get_the_post_thumbnail_url($comapnie->ID);
        $comapnie->link = get_permalink($comapnie->ID);
        $comapnie->logo = $companies_logo;
    }

    $resp = array(
        'result' => $filter_companies_list->posts,
    );

    wp_send_json($resp);
}

add_action('wp_ajax_nopriv_PartnersSort', 'PartnersSort'); //witout logged in
add_action("wp_ajax_PartnersSort", "PartnersSort");


/**
 * Function for filter companies by industry and sort companies by name
 */
function companiesFilter()
{
    global $cur_lang;
    $page_id = $_POST['page_id'];
    $order = $_POST['sort_field'];

    if ($page_id > 0) {
        $offset = ($_POST['count'] * $page_id);
    }

    if ($_POST['filtered_field'] == 'all') {
        $filter_companies_list = new WP_Query(array(
            'post_type'            => 'companies',
            'posts_per_page' => $_POST['count'],
            'order' => $order,
            'offset' => $offset,
            'orderby' => 'title',
            'paged' => get_query_var('paged') ?: 1,
        ));
    } else {
        $filter_companies_list = new WP_Query(array(
            'post_type'            => 'companies',
            'posts_per_page' => $_POST['count'],
            'order' => $order,
            'offset' => $offset,
            'orderby' => 'title',
            'paged' => get_query_var('paged') ?: 1,
            'tax_query'         => [
                'relation '     => 'AND',
                [
                    'taxonomy' => 'companie_industry',
                    'field' => 'term_id',
                    'terms' => $_POST['filtered_field']
                ]
            ],
        ));
    }

    foreach ($filter_companies_list->posts as $comapnie) {
        $companies_logo = get_the_post_thumbnail_url($comapnie->ID);
        $comapnie->link = get_permalink($comapnie->ID);
        $comapnie->logo = $companies_logo;
    }

    $resp = array(
        'result' => $filter_companies_list->posts,
        'companies_count' => $filter_companies_list->max_num_pages,
        'query' => $filter_companies_list,
        'lang' => $cur_lang,
        'order' => $order
    );

    wp_send_json($resp);
}

add_action('wp_ajax_nopriv_companiesFilter', 'companiesFilter'); //witout logged in
add_action("wp_ajax_companiesFilter", "companiesFilter");


/**
 * Function for filter promotions by industry
 */
function promotionFilterIndustry()
{
    $page_id = $_POST['page_id'];

    if ($page_id > 0) {
        $offset = ($_POST['count'] * $page_id);
    }

    if ($_POST['filtered_field'] == 'all') {
        $all_promotions = new WP_Query(array(
            'post_type'            => 'companies',
            'posts_per_page' => -1,
            'offset' => $offset,
            'paged' => get_query_var('paged') ?: 1,
            'fields' => 'ids'
        ));
    } else {
        $all_promotions = new WP_Query(array(
            'post_type'            => 'companies',
            'posts_per_page' =>-1,
            'offset' => $offset,
            'paged' => get_query_var('paged') ?: 1,
            'fields' => 'ids',
            'tax_query'    => [
                [
                    'taxonomy' => 'companie_industry',
                    'field' => 'term_id',
                    'terms' => $_POST['filtered_field']
                ]
            ]                        
        ));
    }

    if($_POST['companies_filtered_field']){
        $industry_promo = new WP_Query(array(
            'post_type'            => 'promotions',
            'meta_query' => [
                [
                    'key' => 'companies_that_this_promotion_refers_to',
                    'compare' => '=',
                    'value' => $_POST['companies_filtered_field']
                ]
            ],
            'posts_per_page' => intval($_POST['count']),
            'paged' => get_query_var('paged') ?: 1,
        ));
    }
    else{
        $industry_promo = new WP_Query(array(
            'post_type'            => 'promotions',
            'meta_query' => [
                [
                    'key' => 'companies_that_this_promotion_refers_to',
                    'compare' => 'IN',
                    'value' => $all_promotions->posts 
                ]
            ],
            'posts_per_page' => intval($_POST['count']),
            'paged' => get_query_var('paged') ?: 1,
        ));
    }

    if ($industry_promo->posts) {
        foreach ($industry_promo->posts as $promotion) {
            $refered_company = get_field('companies_that_this_promotion_refers_to', $promotion->ID);
            $company_industry = get_the_terms($refered_company->ID, 'companie_industry');
            $promotion->industry = $company_industry[0]->term_id;
            $promotion->companie_refered =  $refered_company;
            $promotion->logo = get_the_post_thumbnail_url($promotion->ID);
            $promotion->companie_refered_logo = get_the_post_thumbnail_url($refered_company->ID);
        }

        $filter_result = $industry_promo->posts;
    }


    $resp = array(
        'result' => $filter_result,
        'field' => $_POST['filtered_field']
    );

    wp_send_json($resp);
}

add_action('wp_ajax_promotionFilterIndustry', 'promotionFilterIndustry');
add_action('wp_ajax_nopriv_promotionFilterIndustry', 'promotionFilterIndustry');


/**
 * Function for search parthners by name
 */
function PartnersSearch()
{

    $search_companies_list = new WP_Query(array(
        'post_type'            => 'partners',
        'posts_per_page' => -1,
        'paged' => get_query_var('paged') ?: 1,
        'name' => $_POST['search_query']
    ));

    foreach ($search_companies_list as $comapnie) {
        $companies_logo = get_the_post_thumbnail_url($comapnie->ID);
        $comapnie->link = get_permalink($comapnie->ID);
    }

    $resp = array(
        'result' => $search_companies_list->posts,
    );

    wp_send_json($resp);
}

add_action('wp_ajax_nopriv_PartnersSearch', 'PartnersSearch'); //witout logged in
add_action("wp_ajax_PartnersSearch", "PartnersSearch");


/**
 * Function for search companies by name
 */
function compniesSearch()
{

    $search_companies_list = new WP_Query(array(
        'post_type'            => 'companies',
        'posts_per_page' => -1,
        'paged' => get_query_var('paged') ?: 1,
        's' => $_POST['search_query']
    ));

    foreach ($search_companies_list->posts as $comapnie) {
        $comapnie->link = get_permalink($comapnie->ID);
    }

    $resp = array(
        'success' => true,
        'result' => $search_companies_list->posts,
    );

    wp_send_json($resp);
}

add_action('wp_ajax_nopriv_compniesSearch', 'compniesSearch'); //witout logged in
add_action("wp_ajax_compniesSearch", "compniesSearch");


/**
 * Function for get list of members for current team, when we click on "Show team" in ACC Team page
 */
function getManagerData()
{
    $manager_id = $_POST['manager_id'];

    $manager_team = get_field('manager_team', $manager_id);

    $manager_data = get_post($manager_id);

    $manager_data->logo = get_the_post_thumbnail_url($manager_id);
    $manager_data->position = get_field('manager_position', $manager_id);

    foreach ($manager_team as $manager) {
        $manager_logo = get_the_post_thumbnail_url($manager->ID);
        $manager_position = get_field('manager_position', $manager->ID);
        $manager_email_link = get_field('manager_email_link', $manager->ID);
        $manager_facebook_link = get_field('manager_facebook_link', $manager->ID);
        $manager_twitter_link = get_field('manager_twitter_link', $manager->ID);
        $manager_linkedin_link = get_field('manager_linkedin_link', $manager->ID);

        $manager->manager_logo = $manager_logo;
        $manager->manager_position = $manager_position;
        $manager->manager_email = $manager_email_link;
        $manager->manager_facebook = $manager_facebook_link;
        $manager->manager_twitter = $manager_twitter_link;
        $manager->manager_linkedin = $manager_linkedin_link;
    }

    $resp = array(
        'success' => true,
        'manager_team' => $manager_team,
        'manager' => $manager_data
    );

    wp_send_json($resp);
}

add_action('wp_ajax_nopriv_getManagerData', 'getManagerData'); //witout logged in
add_action("wp_ajax_getManagerData", "getManagerData");


/**
 * Function for get list of all created events, for calendar on Home page and Calendar page 
 */
function getCalendarEvents()
{
    global $cur_lang;
    $today = date('Y-m-d');
    $all_events = new WP_Query(array(
        'post_type'            => 'events',
        'posts_per_page' => -1,
    ));

    $all_events_load = new WP_Query(array(
        'post_type'            => 'events',
        'posts_per_page' => -1,
        'meta_key'          => 'start_date_time',
        'orderby'           => 'meta_value',
        'order'             => 'ASC',
        'meta_query'        => array(
            array(
                'key'       => 'start_date_time',
                'value'     => $today,
                'type'      => 'DATE',
                'compare'   => '>=',
            )
        )
    ));



    if ($all_events_load->posts) {
        foreach ($all_events_load->posts as $event) {


            $date_event =  get_field('start_date_time', $event->ID);
            $date_end_event =  get_field('end_date_time', $event->ID);
            $start_time = date("H:i", strtotime($date_event));
            $end_time = date("H:i", strtotime($date_end_event));
            $event->date = date("Y-m-d", strtotime($date_event));
            $event->place =  get_field('place', $event->ID);
            $event->date =  $date_event;
            $event->price =  get_field('price', $event->ID);
            $event->type =  get_field('type', $event->ID);
            $event->secondary_type =  get_field('secondary_type', $event->ID);
            $event->tag =  get_field('secondary_type', $event->ID);
            $event->title = $event->post_title;
            $event->link = get_permalink($event->ID);
            $event->time =  $start_time . ' - ' .  $end_time;
        }
    }


    $data_massive = [];
    $calendar_events = [];

    $test_array = [];

    if ($all_events->posts) {
        foreach ($all_events->posts as $event) {
            $date_event =  get_field('start_date_time', $event->ID);
            $event->date = date("Y-m-d", strtotime($date_event));

            array_push($test_array, $event->date);

            if ($event->date) {
                $key = array_search($event->date, array_column($data_massive, 'data'));

                if ($key === false) {
                    array_push($data_massive, ['data' => $event->date, 'events' => []]);
                }
            }
        }

        foreach ($all_events->posts as $single_event) {
            $key = array_search($single_event->date, array_column($data_massive, 'data'));
            array_push($data_massive[$key]['events'], $single_event);
        }
    }

    if ($data_massive) {
        foreach ($data_massive as $event) {

            $calendar_events[$event['data']] = [];

            foreach ($event['events'] as $event_single) {

                $start_time = get_field('start_date_time', $event_single->ID);
                $end_time = get_field('end_date_time', $event_single->ID);

                $start_time = date("H:i", strtotime($start_time));
                $end_time = date("H:i", strtotime($end_time));

                $date_event = get_field('start_date_time', $event_single->ID);
                $date_event = date("Y-m-d", strtotime($date_event));
                $event_single->place =  get_field('place', $event_single->ID);
                $event_single->time_intervals =  $start_time . ' - ' .  $end_time;
                $event_single->date =  $date_event;
                $event_single->price =  get_field('price', $event_single->ID);
                $event_single->type =  get_field('type', $event_single->ID);
                $event_single->secondary_type =  get_field('secondary_type', $event_single->ID);
                $event_single->tag =  get_field('secondary_type', $event_single->ID);

                $one_event = [
                    "date" => $event_single->date,
                    "time" => $event_single->time_intervals,
                    "title" =>  $event_single->post_title,
                    "type" => $event_single->type,
                    "secondaryType" => $event_single->secondary_type,
                    "tag" => $event_single->tag,
                    "link" => get_permalink($event_single->ID)
                ];

                array_push($calendar_events[$event['data']], $one_event);
            }
        }
    }

    $resp = array(
        'success' => true,
        'all_event_load' => $all_events_load->posts,
        'lang' =>  $cur_lang,
        'dates' => $data_massive,
        'events' => $all_events->posts,
        'test' => $test_array,
        'calendar' => $calendar_events,
    );

    wp_send_json($resp);
}

add_action('wp_ajax_nopriv_getCalendarEvents', 'getCalendarEvents'); //witout logged in
add_action("wp_ajax_getCalendarEvents", "getCalendarEvents");


/**
 * Function for registartion on event or buy ticket
 */
function registartionOnEvent()
{
    global $wpdb, $userInfo;
    $dublicate_status = false;
    // get type event (paid or free)
    //get type event
    $event_type = get_field('event_type', $_POST['event_id']);

    $dataFromForm = [
        'first_name'        => $_POST['name'],
        'second_name'       => $_POST['second_name'],
        'company'           => $_POST['company'],
        'post'              => $_POST['post'],
        'email'             => $_POST['email'],
        'phone'             => $_POST['phone'],
        'event_price'       => $_POST['event_price'],
        'quantity'          => $_POST['name'],
    ];

    if ($event_type == 'free') {
        $tickets = $wpdb->get_results(
            "
            SELECT * 
            FROM wp_tickets
            WHERE event_id='" . $_POST['event_uuid'] . "' AND (user_id='" . $userInfo->ID . "' OR customer_email='" . $_POST['email'] . "')"
        );

        if (count($tickets) > 0) {
            $info_text = pll__('You are already registered for this event!');
            $dublicate_status = true;
        } else {
            // Create order id
            $order_id = createOrder([
                'user_id'               => $userInfo->ID,
                'customer_email'        => $_POST['email'],
                'event_id'              => $_POST['event_uuid'],
                'type'                  => 'free',
                'amount'                => 0,
                'data_when_pay'         => json_encode($dataFromForm)
            ]);

            //create free teaket
            createEventTicket([
                'user_id'           => $userInfo->ID,
                'customer_email'    => $_POST['email'],
                'event_id'          => $_POST['event_uuid'],
                'order_id'          => $order_id,
                'type_event'        => 'free',
                'formInfo'          => $dataFromForm,
                'type_ticket'       => $_POST['event_type_ticket'] ?: 0,
                'price'             => $_POST['event_price'] ?: 0,
                'status'            => 'new'
            ]);

            $response_text = pll__('Registartion on event success!');
        }
    } else {
        // order
        $Amount = ($_POST['event_price'] * $_POST['quantity']) * 100;

        // Create order id
        $order_id = createOrder([
            'user_id'               => $userInfo->ID,
            'customer_email'        => $_POST['email'],
            'event_id'              => $_POST['event_uuid'],
            'type'                  => 'paid',
            'order_status'          => 'not_payed',
            'amount'                => $Amount,
            'data_when_pay'         => json_encode($dataFromForm)
        ]);


        // create tickets
        for ($i = 0; $i < (int) $_POST['quantity']; $i++) {
            createEventTicket([
                'user_id'           => $userInfo->ID,
                'customer_email'    => $_POST['email'],
                'event_id'          => $_POST['event_uuid'],
                'order_id'          => $order_id,
                'type_event'        => 'paid',
                'formInfo'          => $dataFromForm,
                'type_ticket'       => $_POST['event_type_ticket'],
                'price'             => $_POST['event_price'],
                'status'            => 'not_payed'
            ]);
        }

        $response_text = pll__('Registartion On Event Success!');
        // generate url for pay
        $redirect_url = getUrlPay($Amount, $order_id);
    }

    $resp = array(
        'dublicate_status'  => $dublicate_status,
        'success'           => $response_text,
        'info'              =>  $info_text,
        'event_type'        => $event_type,
        'url'               => $redirect_url,
        'order'             =>  $order_id
    );

    wp_send_json($resp);
}
add_action('wp_ajax_nopriv_registartionOnEvent', 'registartionOnEvent');
add_action("wp_ajax_registartionOnEvent", "registartionOnEvent");


/**
 * Function for approve ticket for event
 */
function approveTicket()
{

    global $wpdb, $image_id;

    $hash_key = bin2hex(random_bytes(14));

    $url = get_home_url() . '/check-ticket?hash_key=' . $hash_key;
    $path = get_template_directory() . '/images/';
    $file = $path . uniqid() . ".png";


    QRcode::png($url, $file);

    $file_array = [
        'name'     => basename($file),
        'tmp_name' => $file
    ];

    $image_id = media_handle_sideload($file_array, 0);


    if ($_POST['approved_type'] == 'approve') {

        $in_status = $wpdb->update(
            $wpdb->prefix . 'tickets',
            array('status' => 'approved', 'comment' => $_POST['approved_comment'], 'hash' => $hash_key),
            array( // где 
                'user_id' => $_POST['user_id']
            ),
            array('%s', '%s', '%s'),
            array('%s')
        );

        $resp = array(
            'message' => pll__('Ticket approved'),
            'response' => true,
        );
    }

    if ($_POST['approved_type'] == 'reject') {

        $in_status = $wpdb->update(
            $wpdb->prefix . 'tickets',
            array('status' => 'reject', 'comment' => $_POST['approved_comment'], 'hash' => $hash_key),
            array( // где 
                'user_id' => $_POST['user_id']
            ),
            array('%s', '%s', '%s'),
            array('%s')
        );

        $resp = array(
            'message' => pll__('Ticket rejected'),
            'response' => true,

        );
    }

    wp_send_json($resp);
}

add_action('wp_ajax_nopriv_approveTicket', 'approveTicket');
add_action("wp_ajax_approveTicket", "approveTicket");


/**
 * Function for get list of all events,for which user buy ticket or register.Show in Profile 
 */
function getUserEvents()
{
    global $wpdb, $userInfo;

    $user_id = get_current_user_id();
    $cur_user_id = $userInfo->data->user_email;

    $events = $wpdb->get_results(
        "
        SELECT * 
        FROM wp_tickets
        WHERE buyer_id = '$cur_user_id'
        "
    );

    $events_list = [];


    foreach ($events as $item) {
        $post = get_post($item->event_id);

        $post->place = get_field('place', $post->ID);
        $post->time_intervals = get_field('time_intervals', $post->ID);
        $post->price = get_field('price', $post->ID);
        $post->date = get_field('date', $post->ID);
        $post->tag = get_field('tag', $post->ID);
        $post->link = get_permalink($post->ID);


        $qr_id = $wpdb->get_var(
            "
            SELECT image_id
            FROM wp_tickets
            WHERE id = '$item->id'
            "
        );

        $email_client = $wpdb->get_var(
            "
            SELECT buyer_id
            FROM wp_tickets
            WHERE id = '$item->id'
            "
        );

        $phone_client = $wpdb->get_var(
            "
            SELECT client_phone
            FROM wp_tickets
            WHERE id = '$item->id'
            "
        );

        $post->phone = $phone_client;
        $post->email = $email_client;

        $imgage_qr = wp_get_attachment_image_url($qr_id);
        $post->qr_link = $imgage_qr;
        array_push($events_list, $post);
    }

    $resp = array(
        // 'create_status' => $create_status,
        'events' =>  $events_list,
        'user_id' => $cur_user_id,
    );

    wp_send_json($resp);
}

add_action('wp_ajax_nopriv_getUserEvents', 'getUserEvents');
add_action("wp_ajax_getUserEvents", "getUserEvents");


/**
 * Function for get list of all events,current comittee or work group or club
 */
function getItemEvents()
{
    if ($_POST['item_type'] == 'directions') {
        $events = new WP_Query(array(
            'post_type'            => 'events',
            'posts_per_page' => -1,
            'paged' => get_query_var('paged') ?: 1,
            'meta_query' => [
                [
                    'key' => 'committees_which_event',
                    'compare' => 'LIKE',
                    'value' => $_POST['page_id']
                ]
            ]
        ));
    }

    if ($_POST['item_type'] == 'work_groups') {
        $events = new WP_Query(array(
            'post_type'            => 'events',
            'posts_per_page' => -1,
            'paged' => get_query_var('paged') ?: 1,
            'meta_query' => [
                [
                    'key' => 'workgroups_which_event',
                    'compare' => 'LIKE',
                    'value' => $_POST['page_id']
                ]
            ]
        ));
    }

    if ($_POST['item_type'] == 'clubs') {
        $events = new WP_Query(array(
            'post_type'            => 'events',
            'posts_per_page' => -1,
            'paged' => get_query_var('paged') ?: 1,
            'meta_query' => [
                [
                    'key' => 'clubs_which_event',
                    'compare' => 'LIKE',
                    'value' => $_POST['page_id']
                ]
            ]
        ));
    }


    foreach ($events->posts as $item) {

        $date_event =  get_field('start_date_time', $item->ID);
        $date_end_event =  get_field('end_date_time', $item->ID);
        $start_time = date("H:i", strtotime($date_event));
        $end_time = date("H:i", strtotime($date_end_event));

        $item->date = date("Y-m-d", strtotime(get_field('start_date_time', $item->ID)));
        $item->place = get_field('place', $item->ID);
        $item->tag = get_field('tag', $item->ID);
        $item->link = get_permalink($item->ID);
        $item->time_intervals = $start_time . ' - ' . $end_time;
    }

    $resp = array(
        // 'create_status' => $create_status,
        'success' =>  true,
        'events' => $events->posts
    );

    wp_send_json($resp);
}

add_action('wp_ajax_nopriv_getItemEvents', 'getItemEvents'); //witout logged in
add_action("wp_ajax_getItemEvents", "getItemEvents");

/**
 * Function for get peymant status of payment system
 */
function GetPaymentStatus()
{
    global $wpdb;

    //$wpdb->show_errors();

    $status = $_POST['TranCode'] == '000' ? 'payed' : 'not_payed';

    $wpdb->update(
        'wp_orders',
        [
            //'response' => $_POST['TranCode'],
            'body_response' => json_encode([
                'Email'                 => $_POST['Email'],
                'TranCode'              => $_POST['TranCode'],
                'MerchantID'            => $_POST['MerchantID'],
                'TotalAmount'           => $_POST['TotalAmount'],
                'OrderID'               => $_POST['OrderID'],
                'ApprovalCode'          => $_POST['ApprovalCode'],
                'ProxyPan'              => $_POST['ProxyPan'],
                'Rrn'                   => $_POST['Rrn'],
                'PurchaseTime'          => $_POST['PurchaseTime'],
                'SD'                    => $_POST['SD'],
                'Currency'              => $_POST['Currency'],
                'Signature'             => $_POST['Signature'],
                'TerminalID'            => $_POST['TerminalID'],
            ]),
            'order_status'              => $status,
            'id_transaction'            => $_POST['Rrn']
        ],
        [
            'order_id' => $_POST['OrderID']
        ],
        ['%s', '%s', '%s'],
        ['%d']
    );

    if ($_POST['TranCode'] == '000') {
        aproverTicketByIdOrder($_POST['OrderID'], $status);
    }

    $resp = array(
        'message'   =>  "Payment status update",
        'content'   => json_encode($_POST),
        'headers'   => json_encode(getallheaders()),
        'status'    => $status
    );

    wp_send_json($resp);
}

add_action('wp_ajax_nopriv_GetPaymentStatus', 'GetPaymentStatus'); //witout logged in
add_action("wp_ajax_GetPaymentStatus", "GetPaymentStatus");

/**
 * Function for get information for build pagination,such as: count of pages and next and previous links 
 */
function getBuildPaginationData()
{
    global $cur_lang;
    global $promotionsIndustry;

    switch ($_POST['type']) {
        case 'news':
            $tax_query = [
                [
                    'taxonomy' => 'news_type',
                    'field' => 'term_id',
                    'terms' => [get_field('current_news_term', $cur_lang)]
                ]
            ];

            $meta_query = [
                [
                    'key' => 'relation_companies',
                    'compare' => '=',
                    'value' => null
                ]
            ];

            $post_type = 'news';
            break;

        case 'speeches':
            $tax_query = [
                [
                    'taxonomy' => 'news_type',
                    'field' => 'term_id',
                    'terms' => [get_field('current_speech_term', $cur_lang)]
                ]
            ];
            $post_type = 'news';
            break;

        case 'publication':
            $tax_query = [
                [
                    'taxonomy' => 'news_type',
                    'field' => 'id',
                    'terms' => [get_field('current_publication_category', $cur_lang)]
                ]
            ];
            $post_type = 'news';
            break;

        case 'expert_materials':
            $tax_query = [
                [
                    'taxonomy' => 'news_type',
                    'field' => 'id',
                    'terms' => [get_field('current_expert_material_category', $cur_lang)]
                ]
            ];
            $post_type = 'news';
            break;

        case 'company':

            if ($_POST['companie_id']) {

                $tax_query = [
                    [
                        'taxonomy' => 'news_type',
                        'field' => 'term_id',
                        'terms' => [get_field('current_news_term', $cur_lang)]
                    ]
                ];

                $meta_query = [
                    [
                        'key' => 'relation_companies',
                        'compare' => '=',
                        'value' => $_POST['companie_id']
                    ]
                ];

                $post_type = 'news';
            } else {
                $empty_companies = [];
                $pre_posts = new WP_Query(array(
                    'post_type'            => 'companies',
                    'posts_per_page'    => -1,
                    'paged'             => get_query_var('paged') ?: 1,
                ));

                foreach ($pre_posts->posts as $single_set) {

                    $no_news = new WP_Query(array(
                        'post_type'            => 'news',
                        'posts_per_page' => 1,
                        'paged' => get_query_var('paged') ?: 1,
                        'tax_query'         => [
                            'relation '     => 'AND',
                            [
                                'taxonomy' => 'news_type',
                                'field' => 'term_id',
                                'terms' => [get_field('current_news_term', $cur_lang)]
                            ]
                        ],
                        'meta_query'        => [
                            [
                                'key' => 'relation_companies',
                                'compare' => '=',
                                'value' => $single_set->ID
                            ]
                        ]
                    ));

                    if ($no_news->posts == null) {
                        array_push($empty_companies, $single_set->ID);
                    }
                }

                $exclude_companies = $empty_companies;
                $post_type = 'companies';
            }
            break;

        case 'companies':
            $order = $_POST['order'];
            $orderby = 'title';

            if ($_POST['filter']) {
                if ($_POST['filter'] == 'all') {
                    $tax_query = '';
                } else {
                    $tax_query = [
                        'relation '     => 'AND',
                        [
                            'taxonomy' => 'companie_industry',
                            'field' => 'term_id',
                            'terms' => $_POST['filter']
                        ]
                    ];
                }
            }

            $post_type = 'companies';
            break;
        case 'promotions':
            if ($_POST['filter']) {
                if ($_POST['filter'] == 'all') {
                    $tax_query = '';
                } else {
                    $tax_query = [
                        'relation '     => 'AND',
                        [
                            'taxonomy' => 'companie_industry',
                            'field' => 'term_id',
                            'terms' => $_POST['filter']
                        ]
                    ];
                }
            }

            $fields = "ids";
            $post_type = 'companies';
            break;            
        case 'events':
            $tax_query = [
                [
                    'taxonomy' => 'event_types',
                    'field' => 'term_id',
                    'terms' => [$_POST['event_type']]
                ]
            ];

            $today = date('Y-m-d');
            if($_POST['event_filter'] == 'past'){
                $meta_query = [
                    [                
                        'key'       => 'start_date_time',
                        'value'     => $today,
                        'type'      => 'DATE',
                        'compare'   => '<',
                    ]
                ];
            }
            else{
                $meta_query = [
                    [                
                        'key'       => 'start_date_time',
                        'value'     => $today,
                        'type'      => 'DATE',
                        'compare'   => '>=',
                    ]
                ];
            }

            $post_type = 'events';
            break;

        default:
            $tax_query = '';
            $order = '';
            $orderby = '';
            $fields = '';
            $exclude_companies = '';
            $post_type = $_POST['type'];
            break;
    }


    if($_POST['type'] == 'promotions'){
        $paginationInfo = new WP_Query(array(
            'post_type'            => $post_type,
            'meta_query' => $meta_query,
            'orderby' => $orderby,
            'order' => $order,
            'post__not_in' => $exclude_companies,
            'posts_per_page' => -1,
            'paged' => get_query_var('paged') ?: 1,
            'tax_query' => $tax_query,
            'fields' => $fields
        ));
    }
    else{
        $paginationInfo = new WP_Query(array(
            'post_type'            => $post_type,
            'meta_query' => $meta_query,
            'orderby' => $orderby,
            'order' => $order,
            'post__not_in' => $exclude_companies,
            'posts_per_page' => intval($_POST['count']),
            'paged' => get_query_var('paged') ?: 1,
            'tax_query' => $tax_query,
            'fields' => $fields
        ));
    }



    $prev_link = get_previous_posts_page_link();
    $next_link = get_next_posts_page_link();


    if($_POST['type'] == 'promotions'){


        $promotionsIndustry = new WP_Query(array(
            'post_type'            => 'promotions',
            'meta_query' => [
                [
                    'key' => 'companies_that_this_promotion_refers_to',
                    'compare' => 'IN',
                    'value' => $paginationInfo->posts 
                ]
            ],
            'posts_per_page' => intval($_POST['count']),
            'paged' => get_query_var('paged') ?: 1,
        ));

        $paginationInfo->max_num_pages = $promotionsIndustry->max_num_pages;
    }


    if($_POST['type'] == 'promotions'){
        $response = array(
            'Pages_count'   =>  $promotionsIndustry->max_num_pages,
            'List by industry' => $promotionsIndustry->posts,
            'Page_content' => $promotionsIndustry,
            'event type' => intval($_POST['event_type']) ,
            'Pagination_type' => $post_type,
            'Prev' => $prev_link,
            'Next' => $next_link,
            'Post count' => intval($_POST['count'])
        );
    }
    else{
        $response = array(
            'Pages_count'   =>  $paginationInfo->max_num_pages,
            'List by industry' => $promotionsIndustry,
            'Page_content' => $paginationInfo,
            'event type' => intval($_POST['event_type']) ,
            'Pagination_type' => $post_type,
            'Prev' => $prev_link,
            'Next' => $next_link,
            'Post count' => intval($_POST['count'])
        );
    }

    wp_send_json($response);
}

add_action('wp_ajax_nopriv_getBuildPaginationData', 'getBuildPaginationData'); //witout logged in
add_action("wp_ajax_getBuildPaginationData", "getBuildPaginationData");

function eventsListFilter()
{
    $today = date('Y-m-d');
    
    if ($_POST['page'] > 0) {
        $offset = ($_POST['count'] * $_POST['page']);
    }

    if ($_POST['filtered_field'] == 'upcoming') {
        $events_sidebar = new WP_Query(array(
            'post_type'            => 'events',
            'offset' => $offset,
            'posts_per_page' => $_POST['count'],
            'meta_key'          => 'start_date_time',
            'orderby'           => 'meta_value',
            'order'             => 'ASC',
            'tax_query'         => [
                'relation '     => 'AND',
                [
                    'taxonomy' => 'event_types',
                    'field' => 'term_id',
                    'terms' => $_POST['tax_id']
                ]
            ],
            'meta_query'        => array(
                array(
                    'key'       => 'start_date_time',
                    'value'     => $today,
                    'type'      => 'DATE',
                    'compare'   => '>=',
                )
            )
        ));
    } else {
        $events_sidebar = new WP_Query(array(
            'post_type'            => 'events',
            'posts_per_page' => -1,
            'offset' => $offset,
            'meta_key'          => 'start_date_time',
            'orderby'           => 'meta_value',
            'order'             => 'ASC',
            'tax_query'         => [
                'relation '     => 'AND',
                [
                    'taxonomy' => 'event_types',
                    'field' => 'term_id',
                    'terms' => $_POST['tax_id']
                ]
            ],
            'meta_query'        => array(
                array(
                    'key'       => 'start_date_time',
                    'value'     => $today,
                    'type'      => 'DATE',
                    'compare'   => '<',
                )
            )
        ));
    }

    foreach ($events_sidebar->posts as $item) {
        $date_event =  get_field('start_date_time', $item->ID);
        $date_end_event =  get_field('end_date_time', $item->ID);
        $start_time = date("H:i", strtotime($date_event));
        $end_time = date("H:i", strtotime($date_end_event));

        $item->date = date("Y-m-d", strtotime(get_field('start_date_time', $item->ID)));
        $item->place = get_field('place', $item->ID);
        $item->tag = get_field('tag', $item->ID);
        $item->link = get_permalink($item->ID);
        $item->time_intervals = $start_time . ' - ' . $end_time;
    }

    $resp = array(
        // 'create_status' => $create_status,
        'success' =>  true,
        'events' => $events_sidebar->posts
    );

    wp_send_json($resp);
}

add_action('wp_ajax_nopriv_eventsListFilter', 'eventsListFilter'); //witout logged in
add_action("wp_ajax_eventsListFilter", "eventsListFilter");
