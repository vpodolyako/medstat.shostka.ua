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
			<div class="container-calendar">

	<h3 id="monthAndYear"></h3>

	<table class="table-calendar" id="calendar" data-lang="en">
	<thead id="thead-month"></thead>
	<tbody id="calendar-body"></tbody>
	</table>

	<div class="footer-container-calendar">

	<select id="month" onchange="jump()">
		<option value=0>Jan</option>
		<option value=1>Feb</option>
		<option value=2>Mar</option>
		<option value=3>Apr</option>
		<option value=4>May</option>
		<option value=5>Jun</option>
		<option value=6>Jul</option>
		<option value=7>Aug</option>
		<option value=8>Sep</option>
		<option value=9>Oct</option>
		<option value=10>Nov</option>
		<option value=11>Dec</option>
	</select>
	<select id="year" onchange="jump()"></select>
	</div>

	</div>
		</div>
	</div>



</main>

<script src="<?php echo get_template_directory_uri() . '/plugins/calendar/calendar.js' ?>"></script>

<?php
get_footer();
?>