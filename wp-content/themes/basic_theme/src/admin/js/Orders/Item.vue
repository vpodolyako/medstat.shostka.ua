<template>
    <tr
        class="iedit author-self level-0 post-488 type-post status-publish format-standard has-post-thumbnail hentry category-novini"
    >
        <td class="title column-title has-row-actions column-primary page-title">
            <a
                :href="`/wp-admin/admin.php?page=orders&order=${item.order_id}`"
            >{{ 'Order #'+item.order_id }}</a>
        </td>
        <td>{{ item.order_status }}</td>
        <td>{{ item.type }}</td>
        <td>{{ item.customer_email }}</td>
        <td>{{ item.amount }} ₴</td>
        <td class="date column-date" data-colname="Date">
            Published
            <br />
            <abbr>{{ item.order_date }}</abbr>
        </td>
    </tr>
</template>
<script>
export default {
    props: ["item"]
};
</script>