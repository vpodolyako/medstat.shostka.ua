<form class="search-form" action="<?php echo home_url( '/' ) ?>">
    <input type="text" placeholder="<?php pll_e('search title'); ?>" name="s" id="s">
    <button class="btn-transparent" type="submit">
        <svg class="icon"> 
            <use xlink:href="<?php echo get_template_directory_uri() ?>/img/icons/svgmap.svg#search" />
        </svg>
    </button>
</form>