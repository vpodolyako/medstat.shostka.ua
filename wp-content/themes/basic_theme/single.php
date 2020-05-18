<?php get_header();

$post = get_post();
?>

<main class="main">
    <article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>

        <section class="section page-section post_body">
            <h1 class="post_title"> <?php the_title()?> </h1>
            <?php echo($post->post_content); ?>
        </section>
    </article>
</main>

<?php get_footer(); ?>