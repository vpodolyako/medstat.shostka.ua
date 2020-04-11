<?php
/* 
	Template Name: About us
	*/
get_header();
?>

<main class="main">
    <section class="section">
        <div class="wrap">
            <?php get_template_part('inc/breadcrumbs'); ?>
        </div>
    </section>

    <?php
    $title = get_the_title();
    $description = get_page(get_the_ID())->post_content;
    $about_us_fields = get_fields();

    get_template_part('inc/title');
    ?>

    <section class="section section-column section-top-bottom section-anim-block">
        <div class="wrap">
            <div class="row ai-flex-start ai-center-xl fd-column-reverse-lg">
                <div class="column col-6 col-lg">
                    <div class="img-lg img-anim">
                        <img src="<?= $about_us_fields['about_video_image'] ?>" alt="">
                    </div>
                </div>
                <div class="column col-5 col-xl-6 col-lg offset-1 offset-xl-0">
                    <div class="block-with-text">
                        <h2 class="title h2 primary-color">
                            <?= $about_us_fields['about_video_title'] ?>
                        </h2>
                        <p>
                            <?= $about_us_fields['about_video_description'] ?>
                        </p>
                        <button class="btn-secondary js-btn-video" type="button" data-video="<?= get_field('video_link') ?>">
                            <svg class="icon">
                                <use xlink:href="<?php echo get_template_directory_uri() ?>/img/icons/svgmap.svg#play" />
                            </svg>
                            <span class="text"> <?php pll_e('show_video_title'); ?> </span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <section class="section section-slider-centered">
        <?php get_template_part('partials/slider-centered-red'); ?>
    </section>


    <section class="section full-screen section-top-bottom section-full-screen-logo">
        <div class="wrap">
            <img src="<?= $about_us_fields['about_vision_image'] ?>" alt="" class="cover">
            <div class="wrap-sm">
                <div class="full-height-block">
                    <h2><?= $about_us_fields['about_vision_title'] ?></h2>
                    <div class="lined-left">
                        <span><?= $about_us_fields['about_vision_description'] ?></span>
                    </div>
                    <img src="<?= $about_us_fields['about_vision_logo'] ?>" alt="" class="logo">
                </div>
            </div>
        </div>
    </section>


    <section class="section section-top-bottom" id="our_mission">
        <div class="wrap">
            <h2 class="h2"><?php pll_e('our_mission_title'); ?></h2>
            <div class="row">
                <?php
                global $single_mission;

                if ($about_us_fields['about_mission_list']) {
                    foreach ($about_us_fields['about_mission_list'] as $single_mission) {
                        get_template_part('partials/about_us/mission');
                    }
                }
                ?>
            </div>
        </div>
    </section>

    <section class="section section-simple-blocks section-outine-blocks">
        <div class="wrap">
            <h2 class="h2">
                <?php pll_e('advantages_title'); ?>
            </h2>
            <div class="row">
                <?php
                global $single_advantage;

                if ($about_us_fields['about_advantages_list']) {
                    foreach ($about_us_fields['about_advantages_list'] as $single_advantage) {
                        get_template_part('partials/general/advantage');
                    }
                }
                ?>
            </div>
        </div>
    </section>

    <section class="section section-simple-blocks section-outine-blocks">
        <div class="wrap">
            <h2 class="h2">
                <?php pll_e('politic_methods_title'); ?>
            </h2>
            <div class="row">
                <?php
                global $card;

                if ($about_us_fields['about_politics_list']) {
                    foreach ($about_us_fields['about_politics_list'] as $card) {
                        get_template_part('partials/general/card');
                    }
                }
                ?>
            </div>
        </div>
    </section>

    <?php get_template_part('inc/provider', 'single'); ?>

</main>

<?php get_template_part('inc/modal-video'); ?>

<?php
get_footer();
?>