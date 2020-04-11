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
		console.log('ready test');
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

        onSubmit() {
                    var notifications = {
                        empty: this.translations["Fill field"],
                        mail:  this.translations["Please enter the correct e-mail address"],
                        phone: this.translations["Please enter the correct number"],
                        error: this.translations["Check that the information you entered is correct"]
                    };

                    var input_fields = document.getElementsByClassName("input_field_contacts");

                    var empty_fields = 0;

                    for (var f = 0; f < input_fields.length; f++) {
                        if (input_fields[f].classList.contains("required")) {
                            if (input_fields[f].value == "") {
                                input_fields[f].style.borderColor = "tomato";
                                input_fields[f].style.backgroundColor = "#fff6f6";
                                input_fields[f].parentNode.querySelector(".text-notification").innerHTML = notifications.empty;
                                input_fields[f].parentNode.querySelector(".text-notification").style.opacity = 1;
                                input_fields[f].parentNode.querySelector(".text-notification").style.visibility = "visible";
                                input_fields[f].parentNode.querySelector(".text-notification").style.color = "tomato";

                                if (input_fields[f].getAttribute("type") == "tel") {
                                    input_fields[f].parentNode.querySelector(".text-notification").innerHTML = notifications.phone;
                                }

                                if (input_fields[f].getAttribute("type") == "email") {
                                    input_fields[f].parentNode.querySelector(".text-notification").innerHTML = notifications.mail;
                                }

                                empty_fields++;
                            } else {
                                // input_fields[f].style.borderColor  = 'green';
                                input_fields[f].parentNode.querySelector(".text-notification").style.opacity = 0;
                                input_fields[f].parentNode.querySelector(".text-notification").style.visibility = "hidden";

                                input_fields[f].style.borderColor = "#003c71";
                                input_fields[f].style.backgroundColor = "#fff";
                            }
                        } else {
                            // input_fields[f].style.borderColor  = 'green';
                            input_fields[f].parentNode.querySelector(".text-notification").style.opacity = 0;
                            input_fields[f].parentNode.querySelector(".text-notification").style.visibility = "hidden";

                            input_fields[f].style.borderColor = "#003c71";
                            input_fields[f].style.backgroundColor = "#fff";
                        }
                    }

                    if (empty_fields == 0) {
                        var cont_name = document.getElementById("cont_name").value;
                        var cont_phone = document.getElementById("cont_phone").value;
                        var cont_email = document.getElementById("cont_email").value;
                        var cont_theme = document.getElementById("cont_theme").value;
                        var cont_message = document.getElementById("cont_message").value;

                        var FeedbackData = new FormData();

                        FeedbackData.append("cont_name", cont_name);
                        FeedbackData.append("cont_phone", cont_phone);
                        FeedbackData.append("cont_email", cont_email);
                        FeedbackData.append("cont_theme", cont_theme);
                        FeedbackData.append("cont_message", cont_message);
                        FeedbackData.append("action", "saveFeedbackForm");

                        axios
                            .post(window.api_settings.ajax_url, FeedbackData, {
                                headers: {
                                    "Content-Type": "multipart/form-data"
                                }
                            })
                            .then(response =>  {
                                this.notificationOpen("success", this.translations["Sent feeback successful"], this.translations["Sent feeback successful description"]);
                                for (var f = 0; f < input_fields.length; f++) {
                                    input_fields[f].value = null;
                                }
                            })
                            .catch(function(error) {
                                console.log(error);
                            });
                    } else {
                        this.notificationOpen("error", this.translations["Error"], this.translations["You have made a mistake in entering the data, please check all fields and try again!"]);
                    }
        }
    }
}
</script>