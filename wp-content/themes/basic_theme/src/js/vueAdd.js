window.Vue = require("vue");

Vue.component("multy-select", require("./multySelect.vue").default);
Vue.component("logform", require("./logform.vue").default);
Vue.component("register-form", require("./formregister.vue").default);
Vue.component("become-member", require("./become_member.vue").default);
Vue.component("contact-form", require("./contact_form.vue").default);
Vue.component("vacancy-form", require("./vacancy-form.vue").default);
Vue.component("register-event-form", require("./register-event-form.vue").default);

if(document.getElementById('app')){
    const app = new Vue({
        el: "#app"
    });
}

