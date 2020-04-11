<?php

global $cur_lang;

if ($cur_lang == 'en') {
    $sub_menu_all = wp_get_nav_menu_items('primary');
} else {
    $sub_menu_all = wp_get_nav_menu_items('Primary_uk');
}

global $page_identifacator;
$current_page_id = get_the_ID();



$page_identifacator = array_search($current_page_id, array_column($sub_menu_all, 'object_id'));
?>

<div class="additional-menu-row">
    <div class="breadcrumbs">
        <ul class="breadcrumbs-list">
            <li id="goBackButton"><a href="<?php echo $_SERVER['HTTP_REFERER'] ?>"><?php pll_e('Back'); ?></a></li>
        </ul>
    </div>

    <div class="additional-menu" id="additional-menu">



        <?php


        if ($cur_lang == 'en') {
            if (wp_get_nav_menu_items('primary')[$page_identifacator]->menu_item_parent == 0) {
                $parent_id = wp_get_nav_menu_items('primary')[$page_identifacator]->ID;
            } else {
                $parent_id = wp_get_nav_menu_items('primary')[$page_identifacator]->menu_item_parent;
            }
        } else {
            if (wp_get_nav_menu_items('Primary_uk')[$page_identifacator]->menu_item_parent == 0) {
                $parent_id = wp_get_nav_menu_items('Primary_uk')[$page_identifacator]->ID;
            } else {
                $parent_id = wp_get_nav_menu_items('Primary_uk')[$page_identifacator]->menu_item_parent;
            }
        }

        if ($post) {
            switch ($post->post_type) {
                case 'news':
                    if ($cur_lang == 'en') {
                        $parent_id = 870;
                    } else {
                        $parent_id = 871;
                    }
                    break;
                case 'directions':
                    if ($cur_lang == 'en') {
                        $parent_id = 160;
                    } else {
                        $parent_id = 159;
                    }
                    break;
                case 'work_groups':
                    if ($cur_lang == 'en') {
                        $parent_id = 160;
                    } else {
                        $parent_id = 159;
                    }
                    break;
                case 'clubs':
                    if ($cur_lang == 'en') {
                        $parent_id = 160;
                    } else {
                        $parent_id = 159;
                    }
                    break;
                case 'success_historys':
                    if ($cur_lang == 'en') {
                        $parent_id = 160;
                    } else {
                        $parent_id = 159;
                    }
                    break;
                case 'events':
                    if ($cur_lang == 'en') {
                        $parent_id = 1723;
                    } else {
                        $parent_id = 1732;
                    }
                    break;
                case 'companies':
                    if ($cur_lang == 'en') {
                        $parent_id = 1363;
                    } else {
                        $parent_id = 1359;
                    }
                    break;
                case 'partners':
                    if ($cur_lang == 'en') {
                        $parent_id = 1363;
                    } else {
                        $parent_id = 1359;
                    }
                    break;
                case 'promotions':
                    if ($cur_lang == 'en') {
                        $parent_id = 1363;
                    } else {
                        $parent_id = 1359;
                    }
                    break;
                case 'vacancies':
                    $parent_id = null;
 
            }
        }

        $term = get_queried_object();

        if ($term) {
            if ($term->taxonomy ==  'event_types') {
                if ($cur_lang == 'en') {
                    $parent_id = 1723;
                } else {
                    $parent_id = 1732;
                }
            }
        }


        //NEED change
        ?>
            <ul class="additional-menu-list" id="additional-menu-list">
                <?php

                if ($cur_lang == 'en') {
                    $sub_menu_all = wp_get_nav_menu_items('primary');
                } else {
                    $sub_menu_all = wp_get_nav_menu_items('Primary_uk');
                }

                if ($sub_menu_all) {
                    foreach ($sub_menu_all as $menu_item) {
                        if ($parent_id == $menu_item->menu_item_parent) {
                            echo '<li><a href="' . $menu_item->url . '">' . $menu_item->title . '</a></li>';
                        }
                    }
                }
                ?>
            </ul>
            <div class="additional-menu-controls" id="additional-menu-controls">
                <button class="btn-transparent btn-slider prev" type="button">
                    <svg class="icon">
                        <use xlink:href="<?= get_template_directory_uri(); ?>/img/icons/svgmap.svg#left" />
                    </svg>
                </button>
                <button class="btn-transparent btn-slider next" type="button">
                    <svg class="icon">
                        <use xlink:href="<?= get_template_directory_uri(); ?>/img/icons/svgmap.svg#right" />
                    </svg>
                </button>
            </div>
    </div>
</div>