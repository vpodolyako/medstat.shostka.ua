<template>
    <div class="wrap">
        <h1 class="wp-heading-inline">Ticket</h1>
        <hr class="wp-header-end" />
        <form>
            <div id="poststuff">
                <div id="post-body" class="metabox-holder columns-2">
                    <div id="postbox-container-2" class="postbox-container">
                        <div id="normal-sortables" class="meta-box-sortables ui-sortable">
                            <div class="postbox acf-postbox">
                                <h2 class="hndle ui-sortable-handle">
                                    <span>Ticket Management</span>
                                </h2>
                                <div class="inside acf-fields -top field-sets">
                                    <div class="acf-field acf-field-text -r0 full">
                                        <div class="acf-label">
                                            <label>User</label>
                                        </div>
                                        <div class="acf-input">
                                            <div class="acf-input-wrap">
                                                <label>{{ ticket.user.email }}</label>
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
                                                    v-model="ticket.customer_email"
                                                />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="acf-field acf-field-text -r0">
                                        <div class="acf-label">
                                            <label>First name</label>
                                        </div>
                                        <div class="acf-input">
                                            <div class="acf-input-wrap">
                                                <input
                                                    type="text"
                                                    v-model="ticket.client_first_name"
                                                />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="acf-field acf-field-text -r0">
                                        <div class="acf-label">
                                            <label>Last name</label>
                                        </div>
                                        <div class="acf-input">
                                            <div class="acf-input-wrap">
                                                <input
                                                    type="text"
                                                    v-model="ticket.client_last_name"
                                                />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="acf-field acf-field-text -r0">
                                        <div class="acf-label">
                                            <label>Company</label>
                                        </div>
                                        <div class="acf-input">
                                            <div class="acf-input-wrap">
                                                <input type="text" v-model="ticket.client_company" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="acf-field acf-field-text -r0">
                                        <div class="acf-label">
                                            <label>Position</label>
                                        </div>
                                        <div class="acf-input">
                                            <div class="acf-input-wrap">
                                                <input type="text" v-model="ticket.client_position" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="acf-field acf-field-text -r0">
                                        <div class="acf-label">
                                            <label>Phone</label>
                                        </div>
                                        <div class="acf-input">
                                            <div class="acf-input-wrap">
                                                <input type="text" v-model="ticket.client_phone" />
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
                                                    :href="`/wp-admin/post.php?post=${ticket.event.ID}&action=edit`"
                                                >{{ ticket.event.post_title }}</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="acf-field acf-field-text -r0">
                                        <div class="acf-label">
                                            <label>Type Event</label>
                                        </div>
                                        <div class="acf-input">
                                            <div class="acf-input-wrap">
                                                <b>{{ ticket.type_event }}</b>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="acf-field acf-field-text -r0">
                                        <div class="acf-label">
                                            <label>Type ticket</label>
                                        </div>
                                        <div class="acf-input">
                                            <div class="acf-input-wrap">{{ ticket.type_ticket }}</div>
                                        </div>
                                    </div>
                                    <div class="acf-field acf-field-text -r0">
                                        <div class="acf-label">
                                            <label>Price</label>
                                        </div>
                                        <div class="acf-input">
                                            <div class="acf-input-wrap">
                                                <b>{{ ticket.price }} ₴</b>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="acf-field acf-field-text -r0">
                                        <div class="acf-label">
                                            <label>Order</label>
                                        </div>
                                        <div class="acf-input">
                                            <div class="acf-input-wrap">
                                                <a
                                                    :href="`/wp-admin/admin.php?page=orders&order=${ticket.order_id}`"
                                                >Order #{{ ticket.order_id }}</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="acf-field acf-field-text -r0">
                                        <div class="acf-label">
                                            <label>Status</label>
                                        </div>
                                        <div class="acf-input">
                                            <div class="acf-input-wrap">
                                                <!-- Need change select -->
                                                <b>{{ ticket.status }}</b>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="acf-field acf-field-text -r0">
                                        <div class="acf-label">
                                            <label>Visited</label>
                                        </div>
                                        <div class="acf-input">
                                            <div class="acf-input-wrap">
                                                <select v-model="ticket.visited">
                                                    <option value="0">No</option>
                                                    <option value="1">Yes</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="acf-field acf-field-text -r0">
                                        <div class="acf-label">
                                            <label>Check QR</label>
                                        </div>
                                        <div class="acf-input">
                                            <div class="acf-input-wrap">
                                                <b>{{ ticket.check_qr ? 'true' : 'false' }}</b>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="acf-field acf-field-text -r0">
                                        <div class="acf-label">
                                            <label>Date</label>
                                        </div>
                                        <div class="acf-input">
                                            <div class="acf-input-wrap">{{ ticket.date }}</div>
                                        </div>
                                    </div>
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
                                                    v-model="ticket.comment"
                                                ></textarea>
                                            </div>
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
            ticket: {}
        };
    },
    mounted() {
        this.getData();
    },
    props: ["ticket_id"],
    methods: {
        getData() {
            axios({
                method: "post",
                url: window.api_settings.ajax_url,
                data: qs.stringify({
                    action: "get_ticket_info",
                    ticket_id: this.ticket_id
                })
            })
                .then(response => {
                    let { data } = response.data;
                    this.ticket = data;
                    console.log({ data });
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
                    action: "update_ticket",
                    id: this.ticket.id,
                    customer_email: this.ticket.customer_email,
                    client_company: this.ticket.client_company,
                    client_first_name: this.ticket.client_first_name,
                    client_last_name: this.ticket.client_last_name,
                    client_phone: this.ticket.client_phone,
                    client_position: this.ticket.client_position,
                    visited: this.ticket.visited,
                    comment: this.ticket.comment
                })
            })
                .then(response => {
                    alert("Ticket updated");
                })
                .catch(error => {});
        }
    }
};
</script>