<?php

//here are custom functions
function my_nav_menu_submenu_css_class($classes)
{
	$classes[] = 'submenu';
	return $classes;
}
add_filter('nav_menu_submenu_css_class', 'my_nav_menu_submenu_css_class');

/**
 * Function for сreating GUID 
 */
function getGUID()
{
	if (function_exists('com_create_guid')) {
		return com_create_guid();
	} else {
		mt_srand((float) microtime() * 10000); //optional for php 4.2.0 and up.
		$charid = strtoupper(md5(uniqid(rand(), true)));
		$hyphen = chr(45); // "-"
		$uuid =
			substr($charid, 0, 8) . $hyphen
			. substr($charid, 8, 4) . $hyphen
			. substr($charid, 12, 4) . $hyphen
			. substr($charid, 16, 4) . $hyphen
			. substr($charid, 20, 12);
		return $uuid;
	}
}


// Numbered Pagination
if (!function_exists('wpex_pagination')) {

	function wpex_pagination()
	{

		$prev_arrow = is_rtl() ? '→' : '←';
		$next_arrow = is_rtl() ? '←' : '→';

		global $wp_query, $wpex_query;
		if ($wpex_query) {
			$total = $wpex_query->max_num_pages;
		} else {
			$total = $wp_query->max_num_pages;
		}

		$big = 999999999; // need an unlikely integer
		if ($total > 1) {
			if (!$current_page = get_query_var('paged'))
				$current_page = 1;
			if (get_option('permalink_structure')) {
				$format = 'page/%#%/';
			} else {
				$format = '&paged=%#%';
			}
			echo paginate_links(array(
				'base'			=> str_replace($big, '%#%', esc_url(get_pagenum_link($big))),
				'format'		=> $format,
				'current'		=> max(1, get_query_var('paged')),
				'total' 		=> $total,
				'mid_size'		=> 3,
				'type' 			=> 'list',
				'prev_text'		=> $prev_arrow,
				'next_text'		=> $next_arrow,
			));
		}
	}
}
