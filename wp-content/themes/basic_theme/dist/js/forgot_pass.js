document.addEventListener("DOMContentLoaded", function(event) { 
    document.getElementById('forgot_form').addEventListener('submit', function(event){
        event.preventDefault();

        var email = document.getElementById('user_email_login').value;
        
        console.log("User Name:" + email);
        var loginForm = new FormData();
        loginForm.append("email", email);

        axios.post(window.api_settings.ajax_url + '?action=checkUser', loginForm)
        .then(function (response) {
            console.log(response);

            var data = response.data;

            if(!data.done){
                if(data.email){
                    console.log("Er email");

                    document.querySelector('#user_email_login ~ .text-notification').innerHTML = data.email;
                    document.querySelector('#user_email_login ~ .text-notification').style.color = 'tomato';
                    document.querySelector('#user_email_login ~ .text-notification').style.opacity = 1;
                    document.querySelector('#user_email_login ~ .text-notification').style.visibility = 'visible';

                    document.querySelector('#user_email_login').style.borderColor  = 'tomato';
                    document.querySelector('#user_email_login').style.backgroundColor  = '#fff6f6';
                }
                else{
                    document.querySelector('#user_email_login ~ .text-notification').innerHTML = '';
                }
            }
            else{
                document.querySelector('#user_email_login ~ .text-notification').style.opacity = 1;
                document.querySelector('#user_email_login ~ .text-notification').style.visibility = 'visible';
                document.querySelector('#user_email_login ~ .text-notification').style.color = 'green';
                document.querySelector('#user_email_login').style.borderColor  = 'green';
                document.querySelector('#user_email_login').style.backgroundColor  = '#e1f5e1';

                document.querySelector('#user_email_login ~ .text-notification').innerHTML = data.done;
            }
        })
        .catch(function (error) {
            console.log(error);
        });
    });
});