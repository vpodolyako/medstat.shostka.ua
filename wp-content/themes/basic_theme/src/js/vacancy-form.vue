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

        onSubmit() {
            var upload_text;
            var input_fields = document.getElementsByClassName("input_field");
            upload_text = $(".file-name").html();
            var empty_fields = 0;

            var notifications = {
                empty: window.api_settings.translations["Fill field"],
                mail: window.api_settings.translations["Please enter the correct e-mail address"],
                phone: window.api_settings.translations["Please enter the correct number"],
                error: window.api_settings.translations["Check that the information you entered is correct"]
            };
            
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

            var response = grecaptcha.getResponse();

            if (response.length == 0) {
                document.querySelector("#reCaptcha ~ .text-notification").innerHTML =  window.api_settings.translations["This field is required"];
                document.querySelector("#reCaptcha ~ .text-notification").style.opacity = 1;
                document.querySelector("#reCaptcha ~ .text-notification").style.visibility = "visible";
                document.querySelector("#reCaptcha ~ .text-notification").style.color = "tomato";
                empty_fields++;
            } else {
                document.querySelector("#reCaptcha ~ .text-notification").innerHTML = "";
            }

            if (empty_fields == 0) {
                var vac_name = document.getElementById("vac_name").value;
                var vac_last = document.getElementById("vac_last").value;
                var vac_email = document.getElementById("vac_email").value;
                var vac_phone = document.getElementById("vac_phone").value;
                var vac_decsription = document.getElementById("vac_decsription").value;
                var vac_file = document.querySelector("#vac_file");
                var vacancy_name = document.querySelector("#vacancy_name").value;

                console.log(vac_file);

                var VacancyData = new FormData();

                VacancyData.append("vac_name", vac_name);
                VacancyData.append("vac_last", vac_last);
                VacancyData.append("vac_email", vac_email);
                VacancyData.append("vac_phone", vac_phone);
                VacancyData.append("vac_decsription", vac_decsription);
                VacancyData.append("vac_file", vac_file.files[0]);
                VacancyData.append("vacancy_name", vacancy_name);

                axios
                    .post(window.api_settings.ajax_url + "?action=saveVacancyForm", VacancyData, {
                        headers: {
                            "Content-Type": "multipart/form-data"
                        }
                    })
                    .then(response =>  {
                        this.notificationOpen("success", this.translations["CV sent successful"], this.translations["CV sent successful description"]);

                        for (var f = 0; f < input_fields.length; f++) {
                            input_fields[f].value = null;
                        }
                    })
                    .catch(function(error) {
                        console.log(error);
                    });
            }
            else{
                this.notificationOpen("error", this.translations["Error"], this.translations["You have made a mistake in entering the data, please check all fields and try again!"]);
            }
        }
    }
}
</script>