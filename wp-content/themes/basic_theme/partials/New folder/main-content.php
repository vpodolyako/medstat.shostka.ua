<?php

// $delimiter = ';';

// $csv = file_get_contents('myfile.csv');
// $rows = explode(PHP_EOL, $csv);
// $data = [];

// foreach ($rows as $row)
// {
//   $data[] = explode($delimiter, $row);
// }


// for($i=0;$i< count($data);$i++){
//     $wpdb->insert( 
//         $wpdb->prefix . 'companies', // указываем таблицу
//         array( // 'название_колонки' => 'значение'
//             'company_name' => $data[$i][0], 
//         ), 
//         array( 
//             '%s', // %s - значит строка
//         ) 
//     );
// }

// print_r($data[0][0]);



?>

<main class="main">
    <section class="section main-section">
        <div class="wrap main-wrap">
            <h1 class="main-title">
                <span class="first-row"><?= get_field('header_title_first') ?></span>
                <span class="secondary-row"><?= get_field('header_title_second_part') ?></span>
            </h1> 
            <div class="main-btns">
                <a href="<?= get_field('header_join_button_link') ?>" class="btn" type="">
                    <svg class="icon">
                        <use xlink:href="<?php echo get_template_directory_uri() ?>/img/icons/svgmap.svg#unlink"/>
                    </svg> 
                    <span> <?php pll_e('Join'); ?> </span>
                </a>
                <button class="btn-secondary js-open-video" type="button" data-video="<?= get_field('video_link') ?>">
                    <svg class="icon">
                        <use xlink:href="<?php echo get_template_directory_uri() ?>/img/icons/svgmap.svg#play"/>
                    </svg>
                    <span><?php pll_e('show_video_title'); ?></span>
                </a>
            </div>
        </div> 
        <video class="main-video" preload="auto" loop autoplay muted>
            <source src="<?= get_field('header_video_file') ?>" type="video/mp4">
        </video>
    </section>
    
    <section class="section section-simple-blocks section-top-bottom">
        <div class="wrap">
            <h2 class="h2 secondary-color">
                <?php pll_e('our_news'); ?>
            </h2>
            <div class="news-block-slider-wrap">
                <div class="news-block-slider-controls lined-slider-controls">
                    <button class="btn-transparent btn-slider prev slick-arrow" type="button">
                        <svg class="icon">
                            <use xlink:href="<?php echo get_template_directory_uri() ?>/img/icons/svgmap.svg#left" />
                        </svg>
                    </button>
                    <button class="btn-transparent btn-slider next slick-arrow" type="button">
                        <svg class="icon">
                            <use xlink:href="<?php echo get_template_directory_uri() ?>/img/icons/svgmap.svg#right" />
                        </svg>
                    </button>
                </div>
                <div class="news-block-row news-block-slider">
                    <?php
                        set_query_var('count_bb_list', 8);
                        get_template_part('partials/news/lists/news_list_homePage'); 
                    ?>
                </div>
            </div>
        </div>
    </section>

    <section class="calendar-section section-top-bottom">
        <div class="wrap">
            <h2 class="h2">
                <?php pll_e('upcoming_events'); ?>
            </h2>
            <div class="calendar-table" id="calendar-table">
                <div class="calendar-column calendar-column-sm">
                    <div class="calendar-title-row">
                        <div class="calendar-title">
                            <span class="h3 current-month" id="choosed-month">
                            </span>
                            <span class="current-year" id="choosed-year">
                            </span>
                        </div>
                        <div class="calendar-controls">
                            <button class="btn-arrow prev" id="month-prev" type="button">
                                <svg class="icon">
                                    <use xlink:href="<?php echo get_template_directory_uri() ?>/img/icons/svgmap.svg#left"/>
                                </svg>
                            </button>
                            <button class="btn-arrow next" id="month-next" type="button">
                                <svg class="icon">
                                    <use xlink:href="<?php echo get_template_directory_uri() ?>/img/icons/svgmap.svg#right"/>
                                </svg>
                            </button>
                        </div>
                    </div>
                    <div class="calendar">
                        <div class="calendar-week" id="calendar-week">
                        </div>   
                        <div class="calendar-day-upper">
                            <div class="current-date-label" id="current-date-label"></div>
                            <div class="calendar-day" id="calendar-days"></div>
                        </div>
                    </div>
                    <div class="calendar-filter-block">
                        <span class="h3"><?php pll_e('Filters'); ?></span>
                        <label class="label-radio all" style="display:none">
                            <input type="radio" name="main-events" date-check="all" checked>
                            <span class="icon"></span>
                            <span class="text">
                                <?php pll_e('All events'); ?>
                            </span>
                        </label>
                        <label class="label-radio primary">
                            <input type="radio" name="main-events" date-check="acc">
                            <span class="icon"></span>
                            <span class="text">
                                <?php pll_e('Events ACC'); ?>
                            </span>
                        </label>
                        <label class="label-radio secondary">
                            <input type="radio" name="main-events" date-check="partners">
                            <span class="icon"></span>
                            <span class="text">
                                <?php pll_e('Events Parthners'); ?>
                            </span>
                        </label>
                    </div>
                    <div class="calendar-filter-block">
                        <span class="h3"><?php pll_e('Activities types'); ?></span>
                        <label class="label-radio thin primary">
                            <input type="radio" name="secondary-events" date-check="all" checked>
                            <span class="icon"></span>
                            <span class="text">
                                <?php pll_e('All activities'); ?>
                            </span>
                        </label>

                        <label class="label-radio thin primary">
                            <input type="radio" name="secondary-events" date-check="B2G">
                            <span class="icon"></span>
                            <span class="text">
                                B2G
                            </span>
                        </label>
                        <label class="label-radio thin primary">
                            <input type="radio" name="secondary-events" date-check="Business Networking">
                            <span class="icon"></span>
                            <span class="text">
                                Business Networking
                            </span>
                        </label>
                        <label class="label-radio thin primary">
                            <input type="radio" name="secondary-events" date-check="Lifecycle Events">
                            <span class="icon"></span>
                            <span class="text">
                                <?php pll_e('Lifecycle Events'); ?>
                            </span>
                        </label>
                        <label class="label-radio thin primary">
                            <input type="radio" name="secondary-events" date-check="Education">
                            <span class="icon"></span>
                            <span class="text">
                                <?php pll_e('Education'); ?>
                            </span> 
                        </label>
                        <label class="label-radio thin primary">
                            <input type="radio" name="secondary-events" date-check="International Conferences">
                            <span class="icon"></span>
                            <span class="text">
                                <?php pll_e('International Conferences'); ?>
                            </span>
                        </label>
                    </div>
                    <div class="calendar-mob-filter">
                        <button class="calendar-mob-filter-button primary-filter-button" id="primary-filter-button" type="button">
                            <?php pll_e('Events ACC'); ?>
                        </button>
                        <button class="calendar-mob-filter-button secondary-filter-button" id="secondary-filter-button" type="button">
                            <?php pll_e('Events Parthners'); ?>
                        </button>
                    </div>
                </div>
                <div class="calendar-column calendar-column-lg">
                    <div class="calendar-title-row">
                        <div class="calendar-title">
                            <span class="h3 current-weekday" id="choosed-date">
                            </span>
                        </div>
                        <div class="calendar-controls">
                            <button class="btn-arrow prev" id="day-prev" type="button">
                                <svg class="icon">
                                    <use xlink:href="<?php echo get_template_directory_uri() ?>/img/icons/svgmap.svg#left"/>
                                </svg>
                            </button>
                            <button class="btn-arrow next" id="day-next" type="button">
                                <svg class="icon">
                                    <use xlink:href="<?php echo get_template_directory_uri() ?>/img/icons/svgmap.svg#right"/>
                                </svg>
                            </button>
                        </div>
                    </div>
                    <div class="calendar-events-row">
                        <div class="calendar-events-column" id="primary-events">
                        </div>
                        <div class="calendar-events-column" id="secondary-events">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="section full-screen section-top-bottom">
        <div class="wrap">
            <div class="full-screen-image">
                <img src="<?= get_field('welcome_to_acc_image') ?>" alt="" class="cover">
                <div class="full-panel-small" id="full-panel-small">
                    <div class="panel-side-left" id="panel-side-left">
                        <h2 class="h2"> 
                            <?= get_field('welcome_to_acc_title') ?>
                        </h2>
                        <img src="<?= get_template_directory_uri(); ?>/img/pattern.png" alt="">
                        <button class="btn-round btn-info" id="btn-info-main" type="button">
                            <svg class="icon">
                                <use xlink:href="<?php echo get_template_directory_uri() ?>/img/icons/svgmap.svg#info" />
                            </svg>
                        </button>
                    </div>
                    <div class="panel-side-right" id="panel-side-right">
                        <div class="panel-side-inner" id="panel-side-right-inner">
                            <p class="secondary-text"> 
                                <?= get_field('welcome_to_acc_description') ?>
                            </p>
                            <a href="<?= get_field('welcome_to_acc_page_link') ?>" class="link secondary">
                            <?= get_field('button_more_title') ?>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <?php get_template_part('inc/provider');?>
</main>
<?php get_template_part('inc/modal-video'); ?>











