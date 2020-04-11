<?php get_header(); ?>

<main class="main">
    <section class="section">
        <div class="wrap">
            <?php get_template_part('inc/breadcrumbs', 'single'); ?>
        </div>
    </section>

    <?php
    while (have_posts()) :
        the_post();
        get_template_part('partials/news_content', 'single');
    endwhile;
    ?>

    <?php get_template_part('inc/provider', 'single'); ?>
</main>

<?php get_footer(); ?>