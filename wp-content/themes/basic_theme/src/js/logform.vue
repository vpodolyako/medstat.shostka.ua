<script>
import { ValidationProvider } from 'vee-validate';

export default {
    data() {
		return {
            lang: window.api_settings.lang,
            translation: window.api_settings.translations,
            logsend: {
                login: '',
                pass: ''            
            }
		}
	},
	mounted() {
		console.log('mounted log')
	},
	ready() {
		console.log('ready log')
	},
	created() {
		console.log('created log')
    },
    methods: {
        onSubmit(){
            var error_fields = 0;
            var notifications;
            var login = document.getElementById('user_email_login');
            var pass = document.getElementById('user_password_login');
            var regExpMail = new RegExp(/^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,8})$/);


            notifications = {
                empty: this.translation['Fill field'],
                login: this.translation['Invalid email'],
                pass: this.translation['Password must contain at least 6 symbols']
            }
            
            if(this.logsend.login == ''){
                login.parentNode.classList.add('error');
                login.parentNode.querySelector('.text-notification').innerHTML = notifications.empty;
                error_fields++;
            } else if(regExpMail.test(this.logsend.login) == false){
                login.parentNode.classList.add('error');
                login.parentNode.querySelector('.text-notification').innerHTML = notifications.login;
                error_fields++;
            } else {
                login.parentNode.classList.remove('error');
                login.parentNode.querySelector('.text-notification').innerHTML = '';
            }

            if(this.logsend.pass == ''){
                pass.parentNode.classList.add('error');
                pass.parentNode.querySelector('.text-notification').innerHTML = notifications.empty;
                error_fields++;
            } else if(this.logsend.pass.length < 6){
                pass.parentNode.classList.add('error');
                pass.parentNode.querySelector('.text-notification').innerHTML = notifications.pass;
                error_fields++;
            } else {
                pass.parentNode.classList.remove('error');
                pass.parentNode.querySelector('.text-notification').innerHTML = '';
            }

            if(error_fields == 0){
                console.log("User Name:" + login.value);
                console.log("User Pass:" + pass.value);

                var loginForm = new FormData();
                loginForm.append("email", login.value);
                loginForm.append("password", pass.value);

                axios.post(window.api_settings.ajax_url + '?action=loginUser_acc', loginForm)
                .then(function (response) {
                    console.log(response);
                    var data = response.data;

                    if(!data.done){
                        if(data.email){
                            document.querySelector('#user_email_login ~ .text-notification').innerHTML = data.email;
                            document.querySelector('#user_email_login').parentNode.classList.add('error');
                        }
                        else{
                            document.querySelector('#user_email_login ~ .text-notification').innerHTML = '';
                            document.querySelector('#user_email_login').parentNode.classList.remove('error');
                        }

                        if(data.password){
                            document.querySelector('#user_password_login ~ .text-notification').innerHTML = data.password;
                            document.querySelector('#user_password_login').parentNode.classList.add('error');
                        }
                        else{
                            document.querySelector('#user_password_login ~ .text-notification').innerHTML = '';
                            
                            document.querySelector('#user_password_login').parentNode.classList.remove('error');
                        }
                    }
                    else{
                        document.querySelector('#user_password_login ~ .text-notification').innerHTML = '';
                        document.querySelector('#user_email_login ~ .text-notification').innerHTML = '';
                        document.location.href="/";
                    }

                })
                .catch(function (error) {
                    console.log(error);
                });
            }
        }
    }
}

</script>