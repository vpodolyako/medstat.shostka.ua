<?php
/* 
	Template Name: News
	*/
get_header();
?>

<main class="main news_page">

	<hr><div class="news_body">
		<div class="news_list">
			<?php 

				global $one_post;

				$posts = get_posts( array(
					'order'       => 'DESC',
					'post_type'   => 'post',
				));

				if( $posts ){
					foreach( $posts as $one_post ){
						get_template_part('partials/news_item');
					}
				}
			?>
		</div>

		<div class="calendar">
			<div class="icalendar">
				<div class="icalendar__month">
					<div class="icalendar__prev" onclick="moveDate('prev')">
					<span>&#10094</span>
					</div>
					<div class="icalendar__current-date">
					<h2 id="icalendarMonth"></h2>
					<div>
						<div id="icalendarDateStr"></div>
					</div>
					</div>
					<div class="icalendar__next" onclick="moveDate('next')">
					<span>&#10095</span>
					</div>
				</div>
				<div class="icalendar__week-days">
					<!-- Localize names of the days of the week -->
					<div>Sun</div>
					<div>Mon</div>
					<div>Tue</div>
					<div>Wed</div>
					<div>Thu</div>
					<div>Fri</div>
					<div>Sat</div>
				</div>
				<div class="icalendar__days"></div>
			</div>
		</div>
	</div>



</main>



<?php
get_footer();
?>