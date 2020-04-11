document.addEventListener("DOMContentLoaded", function(event) { 
    document.getElementById('new_password_form').addEventListener('submit', function(event){
        event.preventDefault();

        var password = document.getElementById('new_password').value;
        var confirm_new_password = document.getElementById('confirm_new_password').value;
        var user_id = document.getElementById('user_id').value;
        
        console.log("User Password:" + password);
        console.log("User ID:" + user_id);

        // if(password == confirm_new_password){
            document.getElementById('new_pass_error').innerHTML = '';

            var newPassForm = new FormData();
            newPassForm.append("password", password);
            newPassForm.append("confirm_password", confirm_new_password);
            newPassForm.append("user_id", user_id);

            axios.post(window.api_settings.ajax_url + '?action=setNewPassword', newPassForm)
            .then(function (response) {
                console.log(response);
                var data = response.data;

                if(data.password){
                    document.querySelector('#new_password ~ .text-notification').innerHTML = data.password;
                    document.querySelector('#new_password ~ .text-notification').style.color = 'tomato';
                    document.querySelector('#new_password ~ .text-notification').style.opacity = 1;
                    document.querySelector('#new_password ~ .text-notification').style.visibility = 'visible';

                    document.querySelector('#new_password').style.borderColor  = 'tomato';
                    document.querySelector('#new_password').style.backgroundColor  = '#fff6f6';

                    document.querySelector('#confirm_new_password')
                }
                else{
                    document.querySelector('#new_password ~ .text-notification').innerHTML = '';
                }

                if(data.confirm_password){
                    document.querySelector('#confirm_new_password ~ .text-notification').innerHTML = data.confirm_password;
                    document.querySelector('#confirm_new_password ~ .text-notification').style.color = 'tomato';
                    document.querySelector('#confirm_new_password ~ .text-notification').style.opacity = 1;
                    document.querySelector('#confirm_new_password ~ .text-notification').style.visibility = 'visible';

                    document.querySelector('#confirm_new_password').style.borderColor  = 'tomato';
                    document.querySelector('#confirm_new_password').style.backgroundColor  = '#fff6f6';
                }
                else{
                    console.log(response);
                    document.querySelector('#confirm_new_password ~ .text-notification').innerHTML = '';
                    document.getElementById('new_pass_success').innerHTML = data.done;
                    document.getElementById('new_pass_success').style.color = 'green';

                    document.querySelector('#confirm_new_password').style.borderColor  = 'green';
                    document.querySelector('#confirm_new_password').style.backgroundColor  = '#e1f5e1';

                    document.querySelector('#new_password').style.borderColor  = 'green';
                    document.querySelector('#new_password').style.backgroundColor  = '#e1f5e1';
                    
                    document.location.href="/";
                }
            })
            .catch(function (error) {
                console.log(error);
            });
    });
});