<?php
/* 
	Template Name: Anniversary 25
	*/
get_header();
$about25_fields = get_fields();

?>

<main class="main">
    <section class="section">
        <div class="wrap">
            <?php get_template_part('inc/breadcrumbs'); ?>
        </div>
    </section>

    <section class="section section-title section-mob-no-wrap">
        <div class="wrap">
            <div class="title-block title-block-bg-image">
                <div class="title-block-inner">
                    <h1 class="h1 title">
                        <?= get_the_excerpt(); ?>
                    </h1>
                    <button class="btn-secondary js-btn-video" type="button" data-video="<?= get_field('main_video') ?>">
                        <svg class="icon">
                            <use xlink:href="<?php echo get_template_directory_uri() ?>/img/icons/svgmap.svg#play" />
                        </svg>
                        <span class="text"><?php pll_e('show_video_title'); ?></span>
                    </button>
                </div>
                <img src="<?= get_field('header_video_img') ?>" alt="" class="cover">
            </div>
        </div>
    </section>



    <section class="section section-mob-no-wrap">
        <div class="wrap">
            <div class="small-carousel-container">
                <div class="small-carousel-controls">
                    <button class="btn-transparent btn-control prev" type="button">
                        <svg class="icon">
                            <use xlink:href="<?php echo get_template_directory_uri() ?>/img/icons/svgmap.svg#left" />
                        </svg>
                    </button>
                    <button class="btn-transparent btn-control next" type="button">
                        <svg class="icon">
                            <use xlink:href="<?php echo get_template_directory_uri() ?>/img/icons/svgmap.svg#right" />
                        </svg>
                    </button>
                </div>
                <div class="small-carousel js-small-carousel">
                    <?php
                    global $single_video;

                    $all_videos = get_field('video_gallery');

                    if ($all_videos) {
                        foreach ($all_videos as $single_video) {
                            get_template_part('partials/video_gallery/item');
                        }
                    }
                    ?>
                </div>
            </div>
        </div>
    </section>

    <section class="section section-column section-top-bottom section-anim-block">
        <div class="wrap">
            <div class="row ai-flex-start ai-center-xl fd-column-reverse-lg">
                <div class="column col-6 col-lg">
                    <div class="img-lg img-anim">
                        <img src="<?= $about25_fields['about25_video_image'] ?>" alt="">
                    </div>
                </div>
                <div class="column col-5 col-xl-6 col-lg offset-1 offset-xl-0">
                    <div class="block-with-text">
                        <h2 class="title h2 primary-color">
                            <?= $about25_fields['about25_video_title'] ?>
                        </h2>
                        <p>
                            <?= $about25_fields['about_video_description'] ?>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="section section-top-bottom">
        <div class="wrap">
            <h2 class="h2">
                <?php pll_e('trump_letter_title'); ?>
            </h2>
            <div class="row">
                <div class="col-4 col-md">
                    <div class="img-fixed-width has-border">
                        <img src="<?= get_field('trump_letter_left_image'); ?>" alt="">
                    </div>
                </div>
                <div class="col-8 col-md">
                    <div class="img-fixed-width">
                        <img src="<?= get_field('trump_letter_right_image'); ?>" alt="" class="cover not-cover-md">
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="section section-column section-top-bottom">
        <div class="wrap">
            <h2 class="h2">
                <?php pll_e('gallery_title'); ?>
            </h2>
            <div class="row">
                <?php get_template_part('partials/gallery/gallery_list'); ?>
            </div>
        </div>
    </section>

    <section class="section section-column section-top-bottom">
        <div class="wrap">
            <h2 class="h2">
                <?php pll_e('sponsors_title'); ?>
            </h2>
            <div class="row">
                <?php
                global $sponsor;
                $sponsors_list = get_field('sponsors_list');

                if ($sponsors_list) {
                    foreach ($sponsors_list as $sponsor) {
                        get_template_part('partials/general/sponsor_25');
                        // get_template_part('partials/sponsors/item');
                    }
                }
                ?>
            </div>
        </div>
    </section>

    <?php get_template_part('inc/provider'); ?>
</main>
<?php get_template_part('inc/modal-video'); ?>
<?php get_template_part('inc/modal-gallery'); ?>

<?php
get_footer();
?>