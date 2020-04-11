<template>
    <div class="wrap">
        <h1 class="wp-heading-inline">Orders</h1>
        <hr class="wp-header-end" />
        <h2 class="screen-reader-text">Filter posts list</h2>
        <form id="posts-filter" method="get">
            <p class="search-box">
                <label class="screen-reader-text" for="post-search-input">Search Order</label>
                <input type="search" id="post-search-input" name="s" value />
                <input type="submit" id="search-submit" class="button" value="Search Event" />
            </p>

            <input type="hidden" name="post_status" class="post_status_page" value="all" />
            <input type="hidden" name="post_type" class="post_type_page" value="post" />
            <h2 class="screen-reader-text">Posts list</h2>
            <table class="wp-list-table widefat fixed striped posts">
                <thead>
                    <tr>
                        <th scope="col" class="manage-column column-title column-primary sortable">
                            <a href="#">
                                <span>Order id</span>
                            </a>
                        </th>
                        <th
                            scope="col"
                            class="manage-column column-title column-primary sortable"
                        >Order status</th>
                        <th
                            scope="col"
                            class="manage-column column-title column-primary sortable"
                        >Order Type</th>
                        <th
                            scope="col"
                            class="manage-column column-title column-primary sortable"
                        >Customer email</th>
                        <th
                            scope="col"
                            class="manage-column column-title column-primary sortable"
                        >Amount</th>
                        <th scope="col" class="manage-column column-date sortable asc">
                            <a href="#">
                                <span>Date</span>
                                <span class="sorting-indicator"></span>
                            </a>
                        </th>
                    </tr>
                </thead>
                <tbody id="the-list">
                    <order-component v-for="item in items" :item="item" :key="item.id"></order-component>
                </tbody>
            </table>
            <div class="tablenav bottom">
                <div class="tablenav-pages one-page">
                    <span class="displaying-num">{{ request.count }} items</span>
                    <span class="pagination-links">
                        <span class="tablenav-pages-navspan button disabled" aria-hidden="true">«</span>
                        <span class="tablenav-pages-navspan button disabled" aria-hidden="true">‹</span>
                        <span class="screen-reader-text">Current Page</span>
                        <span id="table-paging" class="paging-input">
                            <span class="tablenav-paging-text">
                                1 of
                                <span class="total-pages">1</span>
                            </span>
                        </span>
                        <span class="tablenav-pages-navspan button disabled" aria-hidden="true">›</span>
                        <span class="tablenav-pages-navspan button disabled" aria-hidden="true">»</span>
                    </span>
                </div>
                <br class="clear" />
            </div>
        </form>
        <div id="ajax-response"></div>
        <br class="clear" />
    </div>
</template>
<script>
import qs from "qs";
import axios from "axios";
import EventItem from "./Item";
export default {
    data() {
        return {
            items: [],
            request: {
                action: "orders_for_admin",
                page: 0,
                count: 0
            }
        };
    },
    components: {
        "order-component": EventItem
    },
    mounted() {
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
                    let { data, count, page } = response.data;
                    this.request.page++;
                    this.request.count = count;
                    this.items = data;
                })
                .catch(error => {
                    console.error(error);
                });
        }
    }
};
</script>