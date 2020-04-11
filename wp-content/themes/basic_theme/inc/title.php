<?php
global $title;
global $description;
global $button;
global $icon;
global $image;
?>

<section class="section-title">
    <div class="wrap">
        <div class="title-block">
            <?php
            if ($_GET['company_id'] && get_the_post_thumbnail_url($_GET['company_id'])) {
                ?>
                <div class="title-logo">
                    <img src="<?= get_the_post_thumbnail_url($_GET['company_id']); ?>">
                </div>
            <?php
            }
            ?>
            <div class="content_header">
                        <h1 class="h1 title"><?= $title; ?></h1>
                <?php if ($description) { ?>
                    <div class="description"><?= $description; ?></div>
                <?php } ?>
                <?php if ($button) { ?>
                    <a href="#" class="btn-secondary">
                        <?php if ($icon) { ?>
                            <svg class="icon">
                                <use xlink:href="<?php echo get_template_directory_uri() ?>/img/icons/svgmap.svg#<?= $icon; ?>" />
                            </svg>
                        <?php } ?>
                        <span class="text"><?= $button; ?></span>
                    </a>
                <?php } ?>        
            </div>
            <?php if ($image) { ?>
                <img class="image_heaader" src="<?= $image; ?>" alt="">
            <?php } ?> 
        </div>
    </div>
</section>