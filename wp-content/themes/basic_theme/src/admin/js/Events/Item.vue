<template>
    <tr
        class="iedit author-self level-0 post-488 type-post status-publish format-standard has-post-thumbnail hentry category-novini"
    >
        <td
            class="title column-title has-row-actions column-primary page-title"
            data-colname="Title"
        >
            <div class="locked-info">
                <span class="locked-avatar"></span>
                <span class="locked-text"></span>
            </div>
            <strong>
                <a
                    class="row-title"
                    :href="'/wp-admin/admin.php?page=custompage&event='+item.id"
                >{{ item.title }}</a>
            </strong>
        </td>
        <!-- <td class="author column-author">
            <b>{{ item.author }}</b>
        </td>
        <td class="categories column-categories">
            <b>Новини</b>
        </td>-->
        <td>{{ `${item.allTicket}(${item.approve})` }}</td>
        <td>{{ item.lang }}</td>
        <td class="date column-date" data-colname="Date">
            Published
            <br />
            <abbr>{{ item.date }}</abbr>
        </td>
    </tr>
</template>
<script>
export default {
    props: ["item"]
};
</script>