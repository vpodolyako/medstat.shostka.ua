<?php
// Protect against arbitrary paged values
$paged = (get_query_var('paged')) ? absint(get_query_var('paged')) : 1;

$args = array(
    'post_type' => 'companies',
    'post_status' => 'publish',
    'posts_per_page' => 1,
    'paged' => $paged,
    'order' => 'ASC',
    'orderby' => 'title',
);

$the_query = new WP_Query($args);

echo '<pre>';
print_r($the_query->posts);
echo '</pre>';

?>



<?php



echo '<div id="pagination_body">';
echo paginate_links(array(
    'format'  => 'page/%#%',
    'current' => $paged,
    'total'   => $the_query->max_num_pages,
    'mid_size'        => 2,
    'prev_text'       => __('				<svg class="icon">
    <use xlink:href="<?php echo get_template_directory_uri() ?>/img/icons/svgmap.svg#left"/>
</svg>'),
    'next_text'       => __('Next Page &raquo;')
));
echo '</div>';
?>