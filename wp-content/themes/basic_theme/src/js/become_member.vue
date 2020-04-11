<script>
import qs from "qs";
// import {ValidateForm} from './../../dist/js/script.js';

export default {
    data() {
        return {
            translation: window.api_settings.translations,
            lang: window.api_settings.lang,
            memberForm: {
                accountid: "",
                company_name: "",
                company_phone: "",
                company_adress: "",
                company_city: "",
                company_general_email: "",
                company_postal_code: "",
                company_website: "",
                company_country: "",
                representiveOffices: [],
                person_name: "",
                person_phone: "",
                person_job: "",
                person_email: "",
                ceo_name: "",
                ceo_cellphone: "",
                ceo_job: "",
                ceo_email: "",
                ceo_telephone: "",
                ceo_birth_date: "",
                financial_name: "",
                financial_cellphone: "",
                financial_job: "",
                financial_email: "",
                financial_telephone: "",
                company_industry: "",
                company_product_offered: "",
                company_type: "",
                company_beneficial_owner: "",
                operating_in_ukraine: "",
                company_headquaters_country: "",
                company_numbers_employees_world: "",
                company_numbers_employees_ukraine: "",
                amount_investments: "",
                company_type_other: "",
                reason_join: [],
                reason_join_other: "",
                interested_committees: "",
                way_to_find_of_chember: [],
                way_to_find_of_chember_other: "",
                consent_check_box: "",
                code_edrpou: ""
            }
        };
    },
    methods: {
        changeMulty({ value, attribute }) {
            this.memberForm[attribute] = value;
        },
        chnageChecBox() {
            if (document.getElementById("other_handler").checked == true) {
                document.getElementById("other_field_reason").style.display =
                    "block";
            } else {
                document.getElementById("other_field_reason").style.display =
                    "none";
            }
        },

        chnageChecBoxFind() {
            if (document.getElementById("other_handler_find").checked == true) {
                document.getElementById(
                    "other_way_to_find_of_chember"
                ).style.display = "block";
            } else {
                document.getElementById(
                    "other_way_to_find_of_chember"
                ).style.display = "none";
            }
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
                setTimeout(response => {
                    this.notificationClose();
                }, 3000);
            } else if (type == "success") {
                notification.classList.add("success");
                notification.classList.remove("info");
                notification.classList.remove("error");
                setTimeout(response => {
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

        onSubmit() {
            this.memberForm.accountid = document.getElementById(
                "accountid"
            ).value;

            var test_forma = qs.stringify(this.memberForm);

            if (this.validated()) {
                axios({
                    method: "post",
                    url:
                        window.api_settings.ajax_url +
                        "?action=become_member_save",
                    data: test_forma
                })
                    .then(response => {
                        var data = response.data;

                        if (data.done) {
                            this.notificationOpen(
                                "success",
                                notifications.sucess_title,
                                notifications.sucess_text
                            );
                        }
                    })
                    .catch(function(error) {
                        console.error(error);
                    });
            } else {
                var errorBlocks = document.querySelectorAll(
                    ".label-text.error"
                );
                var errorBlocksTop =
                    errorBlocks[0].getBoundingClientRect().top +
                    window.pageYOffset -
                    100;
                window.scrollTo({
                    top: errorBlocksTop,
                    left: 0,
                    behavior: "smooth"
                });
                this.notificationOpen(
                    "error",
                    notifications.erorr_title,
                    notifications.erorr_text
                );
            }
        }
    },
    validated() {
        var country_select = document.getElementById("country_select");
        var country_city = document.getElementById("country_city");
        var company_industry = document.getElementById("company_industry");
        var company_headquaters_country = document.getElementById(
            "company_headquaters_country"
        );
        var interested_committees = document.getElementById(
            "interested_committees"
        );
        var checkers = document.getElementsByClassName("checkbox_body");
        var required_checbox = document.getElementById("consent_check_box");
        var multiselects = [
            {
                value: this.memberForm.company_country,
                object: country_select
            },
            {
                value: this.memberForm.company_city,
                object: country_city
            },
            {
                value: this.memberForm.company_industry,
                object: company_industry
            },
            {
                value: this.memberForm.company_headquaters_country,
                object: company_headquaters_country
            },
            {
                value: this.memberForm.interested_committees,
                object: interested_committees
            }
        ];

        var checkboxes = [
            { value: this.memberForm.representiveOffices },
            { value: this.memberForm.company_beneficial_owner },
            { value: this.memberForm.reason_join },
            { value: this.memberForm.way_to_find_of_chember }
        ];

        var textRegExp = new RegExp("^.{3,40}$");
        var mailRegExp = new RegExp("^[A-z0-9_-]+@[A-z0-9-]+.[A-z]{2,15}$");
        var phoneRegExp = new RegExp("^[0-9- ()+]{4,20}$");

        var validation = {
            isEmail: function(str) {
                var pattern = /^[A-z0-9_-]+@[A-z0-9-]+\.[A-z]{2,15}$/;
                return pattern.test(str);
            },
            isNotEmpty: function(str) {
                var pattern = /\S+/;
                return pattern.test(str);
            },
            isNumber: function(str) {
                var pattern = /^\d+$/;
                return pattern.test(str);
            },
            isPhone: function(str) {
                var pattern = /^[0-9\- ()+]{4,20}$/;
                return pattern.test(str);
            },
            isLetter: function(str) {
                var pattern = /^.{3,40}$/;
                return pattern.test(str);
            },
            isDate: function(str) {
                var pattern = /([12]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01]))/;
                return pattern.test(str);
            }
        };

        var notifications = {
            empty: this.translation["Fill field"],
            mail: this.translation["Please enter the correct e-mail address"],
            phone: this.translation["Please enter the correct number"],
            error: this.translation[
                "Check that the information you entered is correct"
            ],
            required: this.translation["This field is required"],
            sucess_title: this.translation["Application Submitted"],
            sucess_text: this.translation[
                "Your application has been successfully submitted!"
            ],
            erorr_title: this.translation["Error"],
            erorr_text: this.translation[
                "You have made a mistake in entering the data, please check all fields and try again!"
            ]
        };

        var validateForm = document.querySelectorAll(".js-validate-form");

        for (var v = 0; v < validateForm.length; v++) {
            var canSubmit = true;

            var labelLetter = validateForm[v].querySelectorAll(".label-letter");
            var labelMail = validateForm[v].querySelectorAll(".label-mail");
            var labelPhone = validateForm[v].querySelectorAll(".label-phone");
            var labelNumber = validateForm[v].querySelectorAll(".label-number");
            var labelDate = validateForm[v].querySelectorAll(
                ".label-date.label-required"
            );
            var labelRequired = validateForm[v].querySelectorAll(
                ".label-required"
            );

            for (var i = 0; i < labelRequired.length; i++) {
                var empty = validation.isNotEmpty(
                    labelRequired[i].querySelector("input").value
                );
                if (!empty) {
                    canSubmit = false;
                    labelRequired[i].classList.add("error");
                    labelRequired[i].querySelector(
                        ".text-notification"
                    ).innerHTML = notifications.required;
                } else {
                    labelRequired[i].classList.remove("error");
                }
            }

            for (var i = 0; i < labelMail.length; i++) {
                var mailVal = validation.isEmail(
                    labelMail[i].querySelector("input").value
                );
                if (!mailVal) {
                    canSubmit = false;
                    labelMail[i].classList.add("error");
                    labelMail[i].querySelector(".text-notification").innerHTML =
                        notifications.mail;
                } else {
                    labelMail[i].classList.remove("error");
                }
            }

            for (var i = 0; i < labelPhone.length; i++) {
                var phoneVal = validation.isPhone(
                    labelPhone[i].querySelector("input").value
                );
                if (!phoneVal) {
                    canSubmit = false;
                    labelPhone[i].classList.add("error");
                    labelPhone[i].querySelector(
                        ".text-notification"
                    ).innerHTML = notifications.phone;
                } else {
                    labelPhone[i].classList.remove("error");
                }
            }

            for (var i = 0; i < labelNumber.length; i++) {
                var numberVal = validation.isNumber(
                    labelNumber[i].querySelector("input").value
                );
                if (!numberVal) {
                    canSubmit = false;
                    labelNumber[i].classList.add("error");
                    labelNumber[i].querySelector(
                        ".text-notification"
                    ).innerHTML = notifications.error;
                } else {
                    labelNumber[i].classList.remove("error");
                }
            }

            for (var i = 0; i < labelDate.length; i++) {
                var dateVal = validation.isDate(
                    labelDate[i].querySelector("input").value
                );
                if (!dateVal) {
                    canSubmit = false;
                    labelDate[i].classList.add("error");
                    labelDate[i].querySelector(".text-notification").innerHTML =
                        notifications.error;
                } else {
                    labelDate[i].classList.remove("error");
                }
            }

            for (var i = 0; i < multiselects.length; i++) {
                if (multiselects[i].value == "") {
                    multiselects[i].object.querySelector(
                        ".select-inner"
                    ).style.borderBottomColor = "#da1f3d";
                    multiselects[i].object.querySelector(
                        ".select-inner"
                    ).style.backgroundColor = "#fff6f6";
                    multiselects[i].object.querySelector(
                        ".select-inner input"
                    ).style.backgroundColor = "#fff6f6";

                    multiselects[i].object.querySelector(
                        ".select-inner div"
                    ).style.color = "#da1f3d";

                    multiselects[i].object.parentNode.querySelector(
                        ".text-notification"
                    ).innerHTML = notifications.required;
                    multiselects[i].object.parentNode.querySelector(
                        ".text-notification"
                    ).style.color = "#da1f3d";
                    canSubmit = false;
                } else {
                    multiselects[i].object.parentNode.querySelector(
                        ".text-notification"
                    ).innerHTML = "";
                    multiselects[i].object.querySelector(
                        ".select-inner div"
                    ).style.color = "black";
                    multiselects[i].object.querySelector(
                        ".select-inner"
                    ).style.borderBottomColor = "#003c71";
                    multiselects[i].object.querySelector(
                        ".select-inner"
                    ).style.backgroundColor = "#fff";
                    multiselects[i].object.querySelector(
                        ".select-inner input"
                    ).style.backgroundColor = "#fff";
                }
            }

            for (var i = 0; i < checkboxes.length; i++) {
                if (checkboxes[i].value == "") {
                    checkers[i].style.borderColor = "#da1f3d";
                    checkers[i].nextElementSibling.innerHTML =
                        notifications.required;
                    checkers[i].nextElementSibling.style.color = "#da1f3d";
                    canSubmit = false;
                } else {
                    checkers[i].style.borderColor = "#003c71";
                    checkers[i].nextElementSibling.innerHTML = "";
                }
            }

            if (this.memberForm.company_product_offered == "") {
                document.getElementById(
                    "company_product_offered"
                ).style.borderBottomColor = "#da1f3d";
                document.getElementById(
                    "company_product_offered"
                ).style.backgroundColor = "#fff6f6";
                document.querySelector(
                    "#company_product_offered ~ .upper-title"
                ).style.color = "#da1f3d";

                document
                    .getElementById("company_product_offered")
                    .parentNode.querySelector(".text-notification").innerHTML =
                    notifications.required;
                document
                    .getElementById("company_product_offered")
                    .parentNode.querySelector(
                        ".text-notification"
                    ).style.color = "#da1f3d";
                document
                    .getElementById("company_product_offered")
                    .parentNode.querySelector(
                        ".text-notification"
                    ).style.opacity = 1;
                document
                    .getElementById("company_product_offered")
                    .parentNode.querySelector(
                        ".text-notification"
                    ).style.visibility = "visible";
                canSubmit = false;
            } else {
                document
                    .getElementById("company_product_offered")
                    .parentNode.querySelector(".text-notification").innerHTML =
                    "";
                document.querySelector(
                    "#company_product_offered ~ .upper-title"
                ).style.color = "black";
                document.getElementById(
                    "company_product_offered"
                ).style.borderBottomColor = "#003c71";
                document.getElementById(
                    "company_product_offered"
                ).style.backgroundColor = "#fff";
            }

            if (this.memberForm.company_type == "other") {
                this.memberForm.company_type = this.memberForm.company_type_other;
            }

            if (document.getElementById("other_handler").checked == true) {
                var element_index = this.memberForm.reason_join.indexOf(
                    this.memberForm.reason_join_other
                );

                if (element_index == -1) {
                    if (this.memberForm.reason_join_other != "") {
                        this.memberForm.reason_join.push(
                            this.memberForm.reason_join_other
                        );
                    }
                }
            } else {
                var element_index = this.memberForm.reason_join.indexOf(
                    this.memberForm.reason_join_other
                );

                if (element_index != -1) {
                    this.$delete(this.memberForm.reason_join, element_index);
                }
            }

            if (document.getElementById("other_handler_find").checked == true) {
                var element_index = this.memberForm.way_to_find_of_chember.indexOf(
                    this.memberForm.way_to_find_of_chember_other
                );

                if (element_index == -1) {
                    if (this.memberForm.way_to_find_of_chember_other != "") {
                        this.memberForm.way_to_find_of_chember.push(
                            this.memberForm.way_to_find_of_chember_other
                        );
                    }
                }
            } else {
                var element_index = this.memberForm.way_to_find_of_chember.indexOf(
                    this.memberForm.way_to_find_of_chember_other
                );

                if (element_index != -1) {
                    this.$delete(
                        this.memberForm.way_to_find_of_chember,
                        element_index
                    );
                }
            }

            if (required_checbox) {
                if (required_checbox.checked == false) {
                    required_checbox.parentNode.querySelector(
                        ".text-notification"
                    ).innerHTML = notifications.required;
                    required_checbox.parentNode.querySelector(
                        ".text-notification"
                    ).style.opacity = 1;
                    required_checbox.parentNode.querySelector(
                        ".text-notification"
                    ).style.visibility = "visible";
                    required_checbox.parentNode.querySelector(
                        ".text-notification"
                    ).style.color = "#da1f3d";
                    required_checbox.parentNode.querySelector(
                        ".text-notification"
                    ).style.paddingTop = "10px";
                    canSubmit = false;
                } else {
                    required_checbox.parentNode.querySelector(
                        ".text-notification"
                    ).innerHTML = "";
                    required_checbox.parentNode.querySelector(
                        ".text-notification"
                    ).style.color = "black";
                }
            }
            return canSubmit;
        }
    }
};
</script>