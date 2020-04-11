import axios from "axios";

document.addEventListener("DOMContentLoaded", function(event) {
    eventTableHandler();
});

function eventTableHandler() {
    if (document.getElementById("event_managment")) {
        var handler_links = document.getElementsByClassName("event_table_action");
        var formData = new FormData();
        formData.append("username", "Groucho");
        formData.append("accountnum", 123456);

        console.log(formData);

        for (var i = 0; i < handler_links.length; i++) {
            handler_links[i].addEventListener("click", function(event) {
                event.preventDefault();
                var action_handler = this.getAttribute("data-action");
                var user_id = this.getAttribute("data-user");

                var HandleData = new FormData();
                HandleData.append("action_handler", action_handler);
                HandleData.append("user_id", user_id);
                HandleData.append("action", "EventManagmentActionHandler");

                axios
                    .post(window.api_settings.ajax_url, HandleData, {
                        headers: {
                            "Content-Type": "multipart/form-data"
                        }
                    })
                    .then(function(response) {
                        console.log("Admin:");
                        console.log(response.data);
                        //document.location.reload();
                    });
            });
        }

        var acc = document.getElementsByClassName("accordion");
        var i;

        for (i = 0; i < acc.length; i++) {
            acc[i].addEventListener("click", function() {
                /* Toggle between adding and removing the "active" class,
            to highlight the button that controls the panel */
                this.classList.toggle("active");

                /* Toggle between hiding and showing the active panel */
                var panel = this.nextElementSibling;
                if (panel.style.display === "block") {
                    panel.style.display = "none";
                } else {
                    panel.style.display = "block";
                }
            });
        }
    }
}
