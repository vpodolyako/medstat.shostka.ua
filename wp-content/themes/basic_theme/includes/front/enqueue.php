<?php



function theme_styles_and_scripts()
{
    global $cur_lang;
    global $options_fields;

    //style
    wp_register_style('main', get_template_directory_uri() . '/dist/css/style.css', array(), '1.0', 'all');
    wp_register_style('font-sans', 'https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&display=swap', '1.0', 'all');

    wp_enqueue_style('main');
    wp_enqueue_style('font-sans');

    //scripts

    wp_register_script('axios-script', 'https://unpkg.com/axios/dist/axios.min.js', [], '1.0.0', true);
    wp_register_script('main-script', get_template_directory_uri() . '/dist/js/script.js', ['axios-script'], '1.0.0', true);

    wp_enqueue_script('axios-script');
    wp_enqueue_script('main-script');

    if (is_page_template('page_templates/construstor-page.php')) {
        wp_register_script('charts-js', 'https://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.2/Chart.min.js', [], '1.0.2', true);
        wp_register_script('annual-report-script', get_template_directory_uri() . '/src/js/report.js', ['charts-js'], '1.0.0', true);

        wp_enqueue_script('charts-js');
        wp_enqueue_script('annual-report-script');
    }

    if (is_page_template('page_templates/login.php')) {
        wp_register_script('login-script', get_template_directory_uri() . '/dist/js/login.js');
        wp_enqueue_script('login-script');
    }

    if (is_page_template('page_templates/registration.php')) {
        wp_register_script('reg-script', get_template_directory_uri() . '/dist/js/registration.js');
        wp_enqueue_script('reg-script');
    }

    if (is_page_template('page_templates/forgot_pass.php')) {
        wp_register_script('forgot_pass-script', get_template_directory_uri() . '/dist/js/forgot_pass.js');
        wp_enqueue_script('forgot_pass-script');
    }

    if (is_page_template('page_templates/password-recovery-2.php')) {
        wp_register_script('check_pass-script', get_template_directory_uri() . '/dist/js/check_key.js');
        wp_enqueue_script('check_pass-script');
    }

    //register basic value
    wp_localize_script('main-script', 'api_settings', array(
        'root'          => esc_url_raw(rest_url()),
        'nonce'         => wp_create_nonce('wp_rest'),
        'ajax_url'      => site_url() . '/wp-admin/admin-ajax.php',
        'template'      => get_bloginfo('template_url') . '/',
        'lang'          => $cur_lang,
        'simple_news_displayed_per_page' => $options_fields['simple_news_displayed_per_page'],
        'president_speeches_displayed_per_page' => $options_fields['president_speeches_displayed_per_page'],
        'publications_displayed_per_page' => $options_fields['publications_displayed_per_page'],
        'expert_materials_displayed_per_page' => $options_fields['expert_materials_displayed_per_page'],
        'companies_news_displayed_per_page' => $options_fields['number_of_companies_news_displayed_per_page'],
        'single_company_news_displayed_per_page' => $options_fields['single_company_news_displayed_per_page'],
        'success_stories_displayed_per_page' => $options_fields['success_stories_displayed_per_page'],
        'vacancies_displayed_per_page' => $options_fields['vacancies_displayed_per_page'],
        'number_of_companies_displayed_per_page' => $options_fields['number_of_companies_displayed_per_page'],
        'number_of_parthners_displayed_per_page' => $options_fields['number_of_parthners_displayed_per_page'],
        'promotions_displayed_per_page' => $options_fields['promotions_displayed_per_page'],
        'investment_success_stories_displayed_per_page' => $options_fields['investment_success_stories_displayed_per_page'],
        'events_displayed_per_page' => $options_fields['events_displayed_per_page'],
        'translations'  => []
    ));
}
