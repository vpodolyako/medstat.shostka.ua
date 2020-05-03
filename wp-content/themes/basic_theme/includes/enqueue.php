<?php



function theme_styles_and_scripts()
{
    //style
    wp_register_style('main', get_template_directory_uri() . '/styles/main-styles.css', array(), '1.0', 'all');
    wp_register_style('font-sans', 'https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&display=swap', '1.0', 'all');
    wp_register_style('chart-css', 'https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.css');

    wp_enqueue_style('main');
    wp_enqueue_style('font-sans');
    wp_enqueue_style('chart-css');

    //scripts

    wp_register_script('axios-script', 'https://unpkg.com/axios/dist/axios.min.js', [], '1.0.0', true);
    wp_register_script('main-script', get_template_directory_uri() . '/scripts/main.js');
    wp_register_script('chart-js','https://cdn.jsdelivr.net/npm/chart.js@2.8.0');
    wp_enqueue_script("jquery");
    wp_enqueue_script('chart-js');
    wp_enqueue_script('axios-script');
    wp_enqueue_script('main-script');
}
