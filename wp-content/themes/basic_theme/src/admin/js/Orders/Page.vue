<template>
    <div class="wrap">
        <h1 class="wp-heading-inline">Order</h1>
        <hr class="wp-header-end" />
        <form v-if="loaded">
            <div id="poststuff">
                <div id="post-body" class="metabox-holder columns-2">
                    <div id="postbox-container-2" class="postbox-container">
                        <div id="normal-sortables" class="meta-box-sortables ui-sortable">
                            <div class="postbox acf-postbox">
                                <h2 class="hndle ui-sortable-handle">
                                    <span>Order Management</span>
                                </h2>
                                <div class="inside acf-fields -top field-sets">
                                    <div class="acf-field acf-field-text -r0 full">
                                        <div class="acf-label">
                                            <label>User</label>
                                        </div>
                                        <div class="acf-input">
                                            <div class="acf-input-wrap">
                                                <label>{{ order.user.email }}</label>
                                            </div>
                                        </div>
                                    </div>
                                    <hr />
                                    <div class="acf-field acf-field-text -r0">
                                        <div class="acf-label">
                                            <label>Customer email</label>
                                        </div>
                                        <div class="acf-input">
                                            <div class="acf-input-wrap">
                                                <input
                                                    type="text"
                                                    name
                                                    v-model="order.customer_email"
                                                />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="acf-field acf-field-text -r0">
                                        <div class="acf-label">
                                            <label>Event</label>
                                        </div>
                                        <div class="acf-input">
                                            <div class="acf-input-wrap">
                                                <a
                                                    :href="`/wp-admin/post.php?post=${order.event.ID}&action=edit`"
                                                >{{ order.event.post_title }}</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="acf-field acf-field-text -r0">
                                        <div class="acf-label">
                                            <label>Status</label>
                                        </div>
                                        <div class="acf-input">
                                            <div class="acf-input-wrap">
                                                <!-- {{ order.order_status }} -->
                                                <select v-model="order.order_status">
                                                    <option
                                                        value="new"
                                                        v-if="order.type == 'free'"
                                                    >New</option>
                                                    <option
                                                        value="approved"
                                                        v-if="order.type == 'free'"
                                                    >Approved</option>
                                                    <option
                                                        value="rejected"
                                                        v-if="order.type == 'free'"
                                                    >Rejected</option>
                                                    <option
                                                        value="not_payed"
                                                        v-if="order.type == 'paid'"
                                                    >Not payed</option>
                                                    <option
                                                        value="payed"
                                                        v-if="order.type == 'paid'"
                                                    >Payed</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="acf-field acf-field-text -r0">
                                        <div class="acf-label">
                                            <label>Type</label>
                                        </div>
                                        <div class="acf-input">
                                            <div class="acf-input-wrap">
                                                <b>{{ order.type }}</b>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="acf-field acf-field-text -r0">
                                        <div class="acf-label">
                                            <label>Amount</label>
                                        </div>
                                        <div class="acf-input">
                                            <div class="acf-input-wrap">{{ order.amount / 100 }} ₴</div>
                                        </div>
                                    </div>
                                    <div
                                        class="acf-field acf-field-text -r0"
                                        v-if="order.type == 'paid'"
                                    >
                                        <div class="acf-label">
                                            <label>ID transaction</label>
                                        </div>
                                        <div class="acf-input">
                                            <div class="acf-input-wrap">{{ order.id_transaction }}</div>
                                        </div>
                                    </div>
                                    <!-- Payment system response -->
                                    <!-- <div class="acf-field acf-field-text -r0 full">
                                        <div class="acf-label">
                                            <label>Payment system response</label>
                                        </div>
                                        <div class="acf-input">
                                            <div class="acf-input-wrap">
                                                <pre>
                                                    {{ JSON.parse(order.body_response) }}
                                                </pre>
                                            </div>
                                        </div>
                                    </div>-->
                                    <div>
                                        <hr class="hr" />
                                    </div>
                                    <div class="acf-field acf-field-text -r0 full">
                                        <div class="acf-label">
                                            <label>Comment</label>
                                        </div>
                                        <div class="acf-input">
                                            <div class="acf-input-wrap">
                                                <textarea
                                                    class="acf-input-wrap"
                                                    v-model="order.comment"
                                                ></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="acf-field acf-field-text -r0 full">
                                        <div class="acf-label">
                                            <label>Tickets</label>
                                            <ul class="tickets-list">
                                                <li
                                                    v-for="item in order.tickets"
                                                    :key="item.id"
                                                    :style="{'display' : removeTickets.includes(item.id) ? 'none' : ''}"
                                                >
                                                    <span>ID: {{ item.id }}</span>
                                                    <button
                                                        type="button"
                                                        @click="removeTicket(item.id)"
                                                    >Remove ticket</button>
                                                </li>
                                            </ul>
                                            <button
                                                v-if="removeTickets.length > 0"
                                                type="button"
                                                @click="resetTicket"
                                                class="button button-primary button-large"
                                            >Return tickets</button>
                                        </div>
                                    </div>
                                    <div class="acf-field acf-field-text -r0 full">
                                        <button
                                            type="button"
                                            @click="updateData"
                                            class="button button-primary button-large"
                                        >Update</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="advanced-sortables" class="meta-box-sortables ui-sortable"></div>
                    </div>
                </div>
                <br class="clear" />
            </div>
        </form>
    </div>
</template>
<script>
import qs from "qs";
import axios from "axios";
export default {
    data() {
        return {
            loaded: false,
            removeTickets: [],
            order: {}
        };
    },
    mounted() {
        this.getData();
    },
    props: ["order_id"],
    methods: {
        getData() {
            axios({
                method: "post",
                url: window.api_settings.ajax_url,
                data: qs.stringify({
                    action: "get_order_info",
                    order_id: this.order_id
                })
            })
                .then(response => {
                    let { data } = response.data;
                    this.order = data;
                    this.loaded = true;
                })
                .catch(error => {
                    console.error(error);
                });
        },
        updateData() {
            axios({
                method: "post",
                url: window.api_settings.ajax_url,
                data: qs.stringify({
                    action: "update_order",
                    order_id: this.order.order_id,
                    customer_email: this.order.customer_email,
                    order_status: this.order.order_status,
                    comment: this.order.comment,
                    removeTickets: this.removeTickets
                })
            })
                .then(response => {
                    alert("Order updated");
                })
                .catch(error => {
                    console.error(error);
                });
        },
        removeTicket(id) {
            this.removeTickets.push(id);
        },
        resetTicket() {
            this.removeTickets = [];
        }
    }
};
</script>