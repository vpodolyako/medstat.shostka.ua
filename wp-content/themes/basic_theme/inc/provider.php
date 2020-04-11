<section class="provider-section">
    <div class="wrap">
        <h2 class="h2 secondary-color">
            <?php pll_e('official_providers_title'); ?>
        </h2>
    </div>
    <div class="provider-block primary-bg-color">
        <div class="wrap">
            <div class="provider-slider-controls lined-slider-controls">
                <button class="btn-transparent btn-slider prev" type="button">
                    <svg class="icon">
                        <use xlink:href="<?php echo get_template_directory_uri() ?>/img/icons/svgmap.svg#left" />
                    </svg>
                </button>
                <button class="btn-transparent btn-slider next" type="button">
                    <svg class="icon">
                        <use xlink:href="<?php echo get_template_directory_uri() ?>/img/icons/svgmap.svg#right" />
                    </svg>
                </button>
            </div>
            <div class="provider-slider">

                <?php
                $posts = get_posts(array(
                    'posts_per_page'    => -1,
                    'post_type'            => 'serv-provider'
                ));

                if ($posts) : ?>
                    <?php foreach ($posts as $post) : ?>
                        <div class="provider-item">
                            <img src="<?php the_field('logotip'); ?>" alt="Provider">
                        </div>
                    <?php endforeach; ?>
                    <?php wp_reset_postdata(); ?>
                <?php endif; ?>
            </div>
        </div>
    </div>
</section>