<?php
/*
Template Name: Search Page
*/
get_header();


$search_field = get_search_query();

$search_result = new WP_Query(array(
    'post_type' => array('events', 'news', 'companies'),
    'posts_per_page' => -1,
    's' => $_GET['s']
));


$events_list = [];
$news_list = [];
$companies_list = [];

global $main_event;
global $single_post;
global $item_company;

if ($search_result->posts) {
    foreach ($search_result->posts as $search_item) {

        if ($search_item->post_type == 'events') {
            array_push($events_list, $search_item);
        }

        if ($search_item->post_type == 'news') {
            array_push($news_list, $search_item);
        }

        if ($search_item->post_type == 'companies') {
            array_push($companies_list, $search_item);
        }
    }
}


?>

<main class="main">
    <section class="section">
        <div class="wrap">

            <h3> <?php pll_e('Search result'); ?> </h3>


            <?php if (count($events_list) > 0) { ?>
                <h4> <?php pll_e('Events'); ?>: </h4>
                <div class="row-w news-block-row-w ">
                    <?php
                        foreach ($events_list as $result) {
                            $main_event = $result;
                            get_template_part('partials/general/event-block');
                        }
                        ?>
                </div>
            <?php } ?>

            <?php if (count($companies_list) > 0) { ?>
                <h4> <?php pll_e('Companies'); ?>: </h4>
                <div class="row-w news-block-row-w ">
                    <?php
                        foreach ($companies_list as $result) {
                            $item_company = $result;
                            get_template_part('partials/general/company');
                        }
                        ?>
                </div>
            <?php } ?>

            <?php if (count($news_list) > 0) { ?>
                <h4> <?php pll_e('News'); ?>: </h4>
                <div class="row-w news-block-row-w ">
                    <?php
                        foreach ($news_list as $result) {
                            $single_post = $result;
                            get_template_part('partials/news/item');
                        }
                        ?>
                </div>
            <?php } ?>

            <?php if (count($search_result->posts) == 0) { ?>
                <h4> <?php pll_e('Search returned no data'); ?> </h4>
            <?php } ?>
        </div>
    </section>
    <?php get_template_part('inc/provider'); ?>
</main>




<?php
get_footer();
?>