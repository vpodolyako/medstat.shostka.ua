<template>
    <div class="wrap">
        <h1 class="wp-heading-inline">Events</h1>
        <hr class="wp-header-end" />
        <h2 class="screen-reader-text">Filter posts list</h2>
        <form id="posts-filter" method="get">
            <p class="search-box">
                <label class="screen-reader-text" for="post-search-input">Search Event</label>
                <input type="search" id="post-search-input" name="s" value />
                <input type="submit" id="search-submit" class="button" value="Search Event" />
            </p>

            <input type="hidden" name="post_status" class="post_status_page" value="all" />
            <input type="hidden" name="post_type" class="post_type_page" value="post" />
            <!-- <div class="tablenav top">
                <div class="alignleft actions">
                    <label for="filter-by-date" class="screen-reader-text">Filter by date</label>
                    <select name="m" id="filter-by-date">
                        <option selected="selected" value="1">1</option>
                        <option value="2">2</option>
                    </select>
                    <label class="screen-reader-text" for="cat">Filter by category</label>
                    <select class="postform">
                        <option value="1">1</option>
                        <option value="2">2</option>
                    </select>
                    <input
                        type="submit"
                        name="filter_action"
                        id="post-query-submit"
                        class="button"
                        value="Filter"
                    />
                </div>
                <br class="clear" />
            </div>-->
            <h2 class="screen-reader-text">Posts list</h2>
            <table class="wp-list-table widefat fixed striped posts">
                <thead>
                    <tr>
                        <th
                            scope="col"
                            class="manage-column column-title column-primary sortable desc"
                        >
                            <a href="#">
                                <span>Title</span>
                            </a>
                        </th>
                        <!-- <th scope="col" class="manage-column column-author">Author</th>
                        <th scope="col" class="manage-column column-categories">Categories</th>-->
                        <th scope="col" class="manage-column column-categories">Registration</th>
                        <th scope="col" class="manage-column column-categories">Language</th>
                        <th scope="col" class="manage-column column-date sortable asc">
                            <a href="http://acc.loc/wp-admin/edit.php?orderby=date&amp;order=desc">
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
                    <span class="displaying-num">20 items</span>
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
import OrderItem from "./Item";
export default {
    data() {
        return {
            items: [],
            request: {
                action: "events_for_admin", 
                page: 1
            }
        };
    },
    components: {
        "order-component": OrderItem
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