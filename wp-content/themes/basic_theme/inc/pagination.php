<?php
$pagination_type = get_query_var('pagination_type');
$pagination_list = get_query_var('pagination_list');
$count_items = get_query_var('count_items');

if (get_query_var('count_items_news') != null) {
	$count_items = get_query_var('count_items_news');
} else {
	$count_items = get_query_var('count_items');
}
?>

<?php if ($pagination_list->max_num_pages > 1) {
	?>
	<div class="pagination pagination_news" data-type="<?= $pagination_type ?>" data-compnie="<?= $_GET['company_id'] ?>" data-count="<?= $count_items ?>">
		<ul class="pagination-list">
			<li data-total="<?php echo $pagination_list->max_num_pages; ?>" id="prev_arrow_pagination" class="pagination-item pagination-item-arrow pagination-item-prev">
				<a href="<?php echo get_previous_posts_page_link(); ?>">
					<svg class="icon">
						<use xlink:href="<?php echo get_template_directory_uri() ?>/img/icons/svgmap.svg#left" />
					</svg>
				</a>
			</li>

			<?php
				for ($i = 0; $i < $pagination_list->max_num_pages; $i++) {
					$j = $i + 1;
					echo '<li class="pagination-item pagination_numbers">';
					echo '<a data-total="' . $pagination_list->max_num_pages . '" data-page="' . $i . '" class="paginator">' . $j . '</a>';
					echo '</li>';
				}
				?>

			<li data-total="<?php echo $pagination_list->max_num_pages; ?>" id="next_arrow_pagination" class="pagination-item pagination-item-arrow pagination-item-next">
				<a href="<?php echo get_next_posts_page_link(); ?>">
					<svg class="icon">
						<use xlink:href="<?php echo get_template_directory_uri() ?>/img/icons/svgmap.svg#right" />
					</svg>
				</a>
			</li>
		</ul>
	</div>
<?php
}
?>