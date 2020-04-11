<template>
    <div class="wrap">
        <h1 class="wp-heading-inline">Tickets on Event</h1>
        <hr class="wp-header-end" />
        <h2 class="screen-reader-text">Filter posts list</h2>
        <form id="posts-filter" method="get">
            <input type="hidden" name="post_status" class="post_status_page" value="all" />
            <input type="hidden" name="post_type" class="post_type_page" value="post" />
            <h2 class="screen-reader-text">Posts list</h2>
            <table class="wp-list-table widefat fixed striped posts">
                <thead>
                    <tr>
                        <th
                            scope="col"
                            class="manage-column column-title column-primary sortable desc"
                        >
                            <a href="#">
                                <span>Customer email</span>
                            </a>
                        </th>
                        <th scope="col" class="manage-column column-categories">Type ticket</th>
                        <th scope="col" class="manage-column column-categories">Price</th>
                        <th scope="col" class="manage-column column-categories">Order id</th>
                        <th scope="col" class="manage-column column-categories">Status</th>
                        <th scope="col" class="manage-column column-date sortable asc">
                            <span>Date</span>
                        </th>
                    </tr>
                </thead>
                <tbody id="the-list">
                    <ticket-component v-for="item in items" :item="item" :key="item.id"></ticket-component>
                </tbody>
            </table>
        </form>
        <div id="ajax-response"></div>
        <br class="clear" />
    </div>
</template>
<script>
import qs from "qs";
import axios from "axios";
import Ticket from "../Tickets/Item";
export default {
    data() {
        return {
            items: [""],
            request: {
                action: "get_ticket_by_event",
                uuid: ""
            }
        };
    },
    props: ["uuid"],
    components: {
        "ticket-component": Ticket
    },
    mounted() {
        this.request.uuid = this.uuid;
        //console.log(this.request);
        this.getEvents();
    },
    methods: {
        getEvents() {
            axios({
                method: "post",
                url: window.api_settings.ajax_url,
                data: qs.stringify(this.request)
            })
                .then(response => {
                    let { data } = response.data;
                    this.items = data;
                })
                .catch(error => {
                    console.error(error);
                });
        }
    }
};
</script>