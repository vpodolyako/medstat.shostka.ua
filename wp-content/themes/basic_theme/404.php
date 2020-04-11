<?php get_header(); ?>

	<main class="main">
	    <section class="section section-error">
	    	<img src="<?= get_template_directory_uri();?>/img/404.svg" alt="404" class="error-img">
	        <div class="wrap">
	        	<div class="error-content">
	        		<h1 class="secondary-color">Oops<span class="primary-color h1">...</span></h1>
		        	<p class="text">
		        		<?= pll_e('Page not found'); ?>
		        	</p>
		        	<a href="/index.php" class="btn-secondary">
		        		<?= pll_e('To home page'); ?>
		        	</a>
	        	</div>
	        </div>
	    </section>
	</main>

<?php get_footer(); ?>