<?php
/* 
	Template Name: News
	*/
get_header();
?>

<?php


$myposts = get_posts( array(
	'type' => 'post'
) );

print_r($myposts)


?>

<main class="main">

&#129440;Coronavirus
	 
</main>



<?php
get_footer();
?>