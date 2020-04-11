<script>
import VueTheMask from "vue-the-mask";
import qs from "qs";
import moment from "moment";
import "moment/locale/en-au";
Vue.use(VueTheMask);

export default {
    data() {
        return {
            lang: window.api_settings.lang,
            dynamicMask: "",
            translations: window.api_settings.translations,
            datasend: {
                email: "",
                companies: "",
                company_name: "",
                user_pass: "",
                user_pass_confirm: "",
                salutation: "",
                first_name: "",
                last_name: "",
                birthday: "",
                position: "",
                phone: ""
            }
        };
    },
    methods: {
        changeMulty({ value, attribute }) {
            this.datasend[attribute] = value;
        },

        notificationOpen(type, name, message) {
            var notification = document.getElementById("notification");

            notification.querySelector(".notification-title").innerHTML = name;
            notification.querySelector(
                ".notification-content"
            ).innerHTML = message;

            notification.classList.add("open-notification");
            if (type == "info") {
                notification.classList.add("info");
                notification.classList.remove("success");
                notification.classList.remove("error");
                setTimeout(function() {
                    this.notificationClose();
                }, 3000);
            } else if (type == "success") {
                notification.classList.add("success");
                notification.classList.remove("info");
                notification.classList.remove("error");
                setTimeout(function() {
                    this.notificationClose();
                }, 3000);
            } else if (type == "error") {
                notification.classList.add("error");
                notification.classList.remove("info");
                notification.classList.remove("success");
            }

            notification
                .querySelector(".btn-close")
                .addEventListener("click", response => {
                    this.notificationClose();
                });
        },

        notificationClose() {
            var notification = document.getElementById("notification");
            notification.classList.remove("open-notification");
            notification.classList.remove("info");
            notification.classList.remove("success");
            notification.classList.remove("error");

            notification.querySelector(".notification-title").innerHTML = "";
            notification.querySelector(".notification-content").innerHTML = "";
        },

        validate() {
            this.datasend[attribute] = value;
            var multiselect = document.getElementById("member_field");
            var empty_fields = 0;
            var notifications;
            var input_fields = document.getElementsByClassName("input_field");
            var select_boxes = document.getElementsByClassName("select_box");
            var user_company_field = document.getElementById(
                "user_company_field"
            );
            var pass = document.getElementById("user_p").value;
            var confirm_pass = document.getElementById("confirm_pass").value;
            var nonmember_checbox = document.getElementById("non_member");
            var no_member_field = document.getElementById("no-member_field");
            var member_field = document.getElementById("member_field_block");
            var user_company_field = document.getElementById(
                "user_company_field"
            );
            var user_company = document.getElementById("member_field_block");
            var multiselect = document.getElementById("member_field");

            var validation = {
                isValidDate: function(date) {
                    var today_year = new Date();
                    var birth_date;
                    today_year = moment(today_year).format("YYYY");
                    birth_date = moment(date).format("YYYY");

                    if (birth_date < today_year && birth_date > 1900) {
                        return true;
                    } else {
                        return false;
                    }
                }
            };

            notifications = {
                empty: this.translations["Fill field"],
                mail: this.translations["Invalid email"],
                phone: this.translations["Invalid phone"],
                error: this.translations["Invalid information"],
                company: this.translations["Select a company"],
                pass: this.translations["Check your password"]
            };

            if (
                this.datasend.companies == "" &&
                user_company_field.classList.contains("hidden")
            ) {
                multiselect.classList.add("error");
                document.querySelector(
                    "#member_field ~ .text-notification"
                ).innerHTML = notifications.company;
                empty_fields++;
            } else {
                multiselect.querySelector(
                    "#member_field ~ .text-notification"
                ).innerHTML = "";
                multiselect.classList.remove("error");
            }

            if (
                user_company_field.value == "" &&
                multiselect.classList.contains("hidden")
            ) {
                user_company_field.classList.add("error");
                document.querySelector(
                    "#user_company_field ~ .text-notification"
                ).innerHTML = notifications.company;
                empty_fields++;
            } else {
                document.querySelector(
                    "#user_company_field ~ .text-notification"
                ).innerHTML = "";
                user_company_field.classList.remove("error");
            }

            for (var f = 0; f < input_fields.length; f++) {
                if (input_fields[f].classList.contains("required")) {
                    if (
                        input_fields[f].value == "" &&
                        !input_fields[f].classList.contains("hidden")
                    ) {
                        input_fields[f].parentNode.querySelector(
                            ".text-notification"
                        ).innerHTML = notifications.empty;
                        input_fields[f].parentNode.classList.add("error");

                        if (input_fields[f].getAttribute("type") == "tel") {
                            input_fields[f].parentNode.querySelector(
                                ".text-notification"
                            ).innerHTML = notifications.phone;
                        }

                        if (input_fields[f].getAttribute("type") == "email") {
                            input_fields[f].parentNode.querySelector(
                                ".text-notification"
                            ).innerHTML = notifications.mail;
                        }
                        empty_fields++;
                    } else {
                        input_fields[f].classList.remove("error");
                    }
                } else {
                    input_fields[f].parentNode.querySelector(
                        ".text-notification"
                    ).style.opacity = 0;
                    input_fields[f].parentNode.querySelector(
                        ".text-notification"
                    ).style.visibility = "hidden";

                    input_fields[f].classList.remove("error");
                }
            }

            for (var c = 0; c < select_boxes.length; c++) {
                if (
                    select_boxes[c].querySelector("select").value == "" &&
                    !select_boxes[c]
                        .querySelector("select")
                        .classList.contains("hidden")
                ) {
                    select_boxes[c].querySelector(
                        ".text-notification"
                    ).innerHTML = notifications.empty;

                    select_boxes[c].classList.add("error");
                    empty_fields++;
                } else {
                    select_boxes[c].querySelector(
                        ".text-notification"
                    ).innerHTML = "";
                    select_boxes[c].classList.remove("error");
                }
            }

            if (pass == "" && confirm_pass == "") {
                document
                    .querySelector("#user_p")
                    .parentNode.classList.add("error");
                document
                    .querySelector("#confirm_pass")
                    .parentNode.classList.add("error");

                document
                    .querySelector("#user_p")
                    .parentNode.querySelector(".text-notification").innerHTML =
                    notifications.pass;
                document
                    .querySelector("#confirm_pass")
                    .parentNode.querySelector(".text-notification").innerHTML =
                    notifications.pass;

                empty_fields++;
            } else {
                if (pass != confirm_pass) {
                    if (this.lang == "ua") {
                        document
                            .querySelector("#user_p")
                            .parentNode.querySelector(
                                ".text-notification"
                            ).innerHTML = "Паролі не співпадають";
                        document
                            .querySelector("#confirm_pass")
                            .parentNode.querySelector(
                                ".text-notification"
                            ).innerHTML = "Паролі не співпадають";
                    } else if ((this.lang = "en")) {
                        document
                            .querySelector("#user_p")
                            .parentNode.querySelector(
                                ".text-notification"
                            ).innerHTML = "Passwords are different";
                        document
                            .querySelector("#confirm_pass")
                            .parentNode.querySelector(
                                ".text-notification"
                            ).innerHTML = "Passwords are different";
                    }

                    document
                        .querySelector("#user_p")
                        .parentNode.classList.add("error");

                    document
                        .querySelector("#confirm_pass")
                        .parentNode.classList.add("error");

                    empty_fields++;
                } else {
                    document
                        .querySelector("#user_p")
                        .parentNode.querySelector(
                            ".text-notification"
                        ).innerHTML = "";
                    document
                        .querySelector("#confirm_pass")
                        .parentNode.querySelector(
                            ".text-notification"
                        ).innerHTML = "";

                    document
                        .querySelector("#confirm_pass")
                        .classList.remove("error");
                    document.querySelector("#user_p").classList.remove("error");
                }
            }

            var required_checbox = document.getElementById("check_box");

            if (required_checbox) {
                if (required_checbox.querySelector("input").checked == false) {
                    empty_fields++;

                    required_checbox.classList.add("error");
                } else {
                    // required_checbox.querySelector(
                    //     ".text-notification"
                    // ).innerHTML = "";
                    required_checbox.classList.remove("error");
                }
            }

            var response = grecaptcha.getResponse();

            if (response.length == 0) {
                document.querySelector(
                    "#reCaptcha ~ .text-notification"
                ).innerHTML = this.translations["This field is required"];

                document.querySelector(
                    "#reCaptcha ~ .text-notification"
                ).style.opacity = 1;
                document.querySelector(
                    "#reCaptcha ~ .text-notification"
                ).style.visibility = "visible";
                document.querySelector(
                    "#reCaptcha ~ .text-notification"
                ).style.color = "#da1f3d";
                empty_fields++;
            } else {
                document.querySelector(
                    "#reCaptcha ~ .text-notification"
                ).innerHTML = "";
            }

            var labelDate = document.querySelectorAll(".label-date.required");

            for (var i = 0; i < labelDate.length; i++) {
                var dateVal = validation.isValidDate(labelDate[i].value);

                if (!dateVal) {
                    empty_fields++;
                    labelDate[i].parentNode.classList.add("error");
                    labelDate[i].parentNode.querySelector(
                        ".text-notification"
                    ).innerHTML = notifications.error;
                } else {
                    labelDate[i].parentNode.classList.remove("error");
                }
            }

            console.log({ empty_fields });

            return empty_fields > 0;
        },

        onSubmit({ value, attribute }) {
            if (validate()) {
                axios({
                    method: "post",
                    url:
                        window.api_settings.ajax_url +
                        "?action=register_user_acc",
                    data: qs.stringify(this.datasend)
                })
                    .then(response => {
                        var data = response.data;

                        if (!data.done) {
                            this.notificationOpen(
                                "error",
                                "Error",
                                this.translations[
                                    "You have made a mistake in entering the data, please check all fields and try again!"
                                ]
                            );

                            if (data.email) {
                                document.querySelector(
                                    "#user_email ~ .text-notification"
                                ).innerHTML = data.email;

                                document
                                    .querySelector("#user_email")
                                    .classList.add("error");
                            } else {
                                document.querySelector(
                                    "#user_email ~ .text-notification"
                                ).innerHTML = "";
                                document
                                    .querySelector("#user_email")
                                    .parentNode.classList.remove("error");
                            }

                            if (data.password) {
                                document.querySelector(
                                    "#user_p ~ .text-notification"
                                ).innerHTML = data.password;
                                document
                                    .querySelector("#user_p")
                                    .parentNode.classList.add("error");
                            } else {
                                document.querySelector(
                                    "#user_p ~ .text-notification"
                                ).innerHTML = "";
                                document
                                    .querySelector("#user_p")
                                    .parentNode.classList.remove("error");
                            }

                            if (data.confirm_password) {
                                document.querySelector(
                                    "#confirm_pass ~ .text-notification"
                                ).innerHTML = data.confirm_password;
                                document
                                    .querySelector("#confirm_pass")
                                    .parentNode.classList.add("error");
                            } else {
                                document.querySelector(
                                    "#confirm_pass ~ .text-notification"
                                ).innerHTML = "";
                                document
                                    .querySelector("#confirm_pass")
                                    .parentNode.classList.remove("error");
                            }

                            if (data.login) {
                                document.querySelector(
                                    "#user_name ~ .text-notification"
                                ).innerHTML = data.login;
                                document
                                    .querySelector("#user_name")
                                    .parentNode.classList.add("error");
                            } else {
                                document.querySelector(
                                    "#user_name ~ .text-notification"
                                ).innerHTML = "";
                                document
                                    .querySelector("#user_name")
                                    .parentNode.classList.remove("error");
                            }
                        } else {
                            document.querySelector(
                                "#user_p ~ .text-notification"
                            ).innerHTML = "";
                            document.querySelector(
                                "#user_email ~ .text-notification"
                            ).innerHTML = "";
                            document.querySelector(
                                "#confirm_pass ~ .text-notification"
                            ).innerHTML = "";
                            this.notificationOpen(
                                "success",
                                this.translations["Successful registration"],
                                this.translations[
                                    "Your registration was successful!"
                                ]
                            );
                            setTimeout(() => {
                                //document.location.href = "/";
                            }, 1000);
                        }
                    })
                    .catch(function(error) {
                        console.log(error);
                    });
            }
        }
    }
};
</script>