<script>
import VueTheMask from 'vue-the-mask';
Vue.use(VueTheMask);

export default {
    data () {
		return {
            translations: window.api_settings.translations,
		}
	},
	mounted() {
		console.log('mounted');
	},
	ready() {
		console.log('ready');
	},
	created() {
		console.log('created');
    },
    methods: {
        notificationOpen(type, name, message){
            var notification = document.getElementById('notification');

            notification.querySelector('.notification-title').innerHTML = name;
            notification.querySelector('.notification-content').innerHTML = message;

            notification.classList.add('open-notification');
            if(type == "info"){
                notification.classList.add('info');
                notification.classList.remove('success');
                notification.classList.remove('error');
                setTimeout(response =>{
                    this.notificationClose();
                }, 3000);
            } else if(type == "success"){
                notification.classList.add('success');
                notification.classList.remove('info');
                notification.classList.remove('error');
                setTimeout(response =>{
                    this.notificationClose();
                }, 3000);
            } else if(type == "error"){
                notification.classList.add('error');
                notification.classList.remove('info');
                notification.classList.remove('success'); 
            }

            notification.querySelector('.btn-close').addEventListener('click',response => {
                this.notificationClose();
            });
        },

        notificationClose(){
            var notification = document.getElementById('notification');
            notification.classList.remove('open-notification');
            notification.classList.remove('info');
            notification.classList.remove('success');
            notification.classList.remove('error');

            notification.querySelector('.notification-title').innerHTML = "";
            notification.querySelector('.notification-content').innerHTML = "";
        },


        /**
         * Function for buy tickets
        */
        buyTickets(event_uuid, event_id) {
            var name = document.getElementById("event_name").value;
            var second_name = document.getElementById("event_second_name").value;
            var company = document.getElementById("event_company").value;
            var post = document.getElementById("post_company").value;
            var email = document.getElementById("email_company").value;
            var phone = document.getElementById("phone_company").value;

            var EventData = new FormData();
            EventData.append("action", "registartionOnEvent");
            EventData.append("event_uuid", event_uuid);
            EventData.append("event_id", event_id);

            EventData.append("name", name);
            EventData.append("second_name", second_name);
            EventData.append("company", company);
            EventData.append("post", post);
            EventData.append("email", email);
            EventData.append("phone", phone);

            if (document.getElementById("event_price")) {
                var event_price = document.getElementById("event_price");
                EventData.append("event_price", event_price.value);
                EventData.append("event_type_ticket", event_price.options[event_price.selectedIndex].text);
            }

            if (document.getElementById("quantity")) {
                var quantity = document.getElementById("quantity").value;
                EventData.append("quantity", quantity);
                //test
            }

            axios
                .post(window.api_settings.ajax_url, EventData, {
                    headers: {
                        "Content-Type": "multipart/form-data"
                    }
                })
                .then(function(response) {
                    if (response.data.event_type == "pay") {
                        console.log(response.data);
                        window.location.href = response.data.url;
                    } else {
                        if (response.data.info != null) {
                            this.notificationOpen("info", window.api_settings.translations["Info"], response.data.info);
                        } else {
                            if (response.data.success != null) {
                                this.notificationOpen("success", window.api_settings.translations["Successful registration"], window.api_settings.translations["Event registration"]);
                            } else {
                                if (response.data.error != null) {
                                    this.notificationOpen("error", window.api_settings.translations["Error"], window.api_settings.translations["You were wrong"]);
                                }
                            }
                        }
                    }
                });
        },

        onSubmit() {
            var input_fields = document.getElementsByClassName("input_field_event");

            var empty_fields = 0;

            for (var f = 0; f < input_fields.length; f++) {
                if (input_fields[f].classList.contains("required")) {
                    if (input_fields[f].value == "") {
                        input_fields[f].parentNode.querySelector(".text-notification").innerHTML = "Fill field";
                        input_fields[f].parentNode.classList.add("error");

                        this.notificationOpen("error", window.api_settings.translations["Error"], window.api_settings.translations["You have made"]);

                        empty_fields++;
                    } else {
                        input_fields[f].parentNode.querySelector(".text-notification").innerHTML = "";
                        input_fields[f].parentNode.classList.remove("error");
                    }
                } else {
                    input_fields[f].classList.remove("error");
                }
            }

            if (empty_fields == 0) {
                var event_uuid = document.getElementById('registrationEventForm').getAttribute("data-event-uuid");
                var event_id = document.getElementById('registrationEventForm').getAttribute("data-event-id");
                this.buyTickets(event_uuid, event_id);
            }
        }
    }
}
</script>