<template>
    <tr
        class="iedit author-self level-0 post-488 type-post status-publish format-standard has-post-thumbnail hentry category-novini"
    >
        <td scope="col" class="manage-column column-title column-primary sortable desc">
            <a :href="'/wp-admin/admin.php?page=custompage&ticket_id='+item.id">
                <span>{{item.customer_email}}</span>
            </a>
        </td>
        <td scope="col" class="manage-column column-categories">{{ item.type_ticket }}</td>
        <td scope="col" class="manage-column column-categories">{{ item.price }}</td>
        <td scope="col" class="manage-column column-categories">{{ item.order_id }}</td>
        <td scope="col" class="manage-column column-categories">{{ item.status }}</td>
        <td scope="col" class="manage-column column-date sortable asc">
            <span>{{ item.date }}</span>
        </td>
    </tr>
</template>
<script>
export default {
    props: ["item"]
};
</script>