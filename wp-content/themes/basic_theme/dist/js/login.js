
// document.addEventListener("DOMContentLoaded", function(event) { 
//     document.getElementById('log_form').addEventListener('submit', function(event){
//         event.preventDefault();

      
        
//         console.log("User Name:" + email);
//         console.log("User Pass:" + pass);

//         var loginForm = new FormData();
//         loginForm.append("email", email);
//         loginForm.append("password", pass); 

//         axios.post(window.api_settings.ajax_url + '?action=loginUser_acc', loginForm)
//         .then(function (response) {
//             console.log(response);
//             var data = response.data;

//             if(!data.done){
//                 if(data.email){
//                     document.querySelector('#user_email_login ~ .text-notification').innerHTML = data.email;
//                     document.querySelector('#user_email_login').parentNode.classList.add('error');
//                 }
//                 else{
//                     document.querySelector('#user_email_login ~ .text-notification').innerHTML = '';
//                     document.querySelector('#user_email_login').parentNode.classList.remove('error');
//                 }

//                 if(data.password){
//                     document.querySelector('#user_password_login ~ .text-notification').innerHTML = data.password;
//                     document.querySelector('#user_password_login').parentNode.classList.add('error');
//                 }
//                 else{
//                     document.querySelector('#user_password_login ~ .text-notification').innerHTML = '';
                    
//                     document.querySelector('#user_password_login').parentNode.classList.remove('error');
//                 }
//             }
//             else{
//                 document.querySelector('#user_password_login ~ .text-notification').innerHTML = '';
//                 document.querySelector('#user_email_login ~ .text-notification').innerHTML = '';
//                 document.location.href="/";
//             }

//         })
//         .catch(function (error) {
//             console.log(error);
//         });
//     });
// });
    
