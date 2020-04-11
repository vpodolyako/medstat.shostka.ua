// app.js
import Vue from "vue";

import "../scss/admin.scss";

Vue.component("event-page", require("./Events/Page.vue").default);
Vue.component("events-component", require("./Events/Index.vue").default);
Vue.component("ticket-page", require("./Tickets/Page.vue").default);
Vue.component("orders-page", require("./Orders/Index.vue").default);
Vue.component("order-page", require("./Orders/Page.vue").default);

const app = new Vue({
    el: "#app"
});
