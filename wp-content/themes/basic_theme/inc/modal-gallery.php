<div class="modal" id="js-modal-gallery">
    <button class="modal-close btn-transparent js-modal-close" type="button">
        <svg class="icon">
            <use xlink:href="<?php echo get_template_directory_uri() ?>/img/icons/svgmap.svg#close" />
        </svg>
    </button>
    <div class="modal-dialog modal-dialog-center js-modal-dialog">
        <div class="main-gallery" id="js-main-gallery-carousel">
            <?php get_template_part('partials/gallery/gallery_list_horizontal_another'); ?>
        </div>
        <div class="gallery-carousel" id="js-gallery-carousel">
            <?php get_template_part('partials/gallery/gallery_list_horizontal'); ?>
        </div>
        <div class="gallery-controls">
            <button class="btn-transparent btn-control prev">
                <svg class="icon">
                    <use xlink:href="<?php echo get_template_directory_uri() ?>/img/icons/svgmap.svg#left" />
                </svg>
            </button>
            <button class="btn-transparent btn-control next">
                <svg class="icon">
                    <use xlink:href="<?php echo get_template_directory_uri() ?>/img/icons/svgmap.svg#right" />
                </svg>
            </button>
        </div>
    </div>
</div>