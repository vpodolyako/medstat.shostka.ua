<?php 
    global $one_post;

    // print_r($one_post);
    // echo get_the_post_thumbnail_url($one_post->ID);
?>


<div class="single_news_block">
    <div class="title_part">
        <h3><a href="<?= get_permalink($one_post->ID) ?>"><?php  echo $one_post->post_title ?></a></h3>
        <img  src="<?= get_the_post_thumbnail_url($one_post->ID); ?>" alt="">
    </div>

    <div class="description_part">
        <p class="date"><?= date("Y-m-d", strtotime($one_post->post_date)); ?></p>
        <p><?php print_r($one_post->post_excerpt) ?></p>

        <a href="<?= get_permalink($one_post->ID) ?>">Show more</a>
    </div>
</div>