export default {
    template: `
        <div class="container">
            <div class="jumbotron roku-jumbotron">
                <img src="images/roku.svg" id="loginRokuLogo" alt="Roku Logo" width="250">
                <img src="images/flashback-purple.svg" id="loginFlashbackLogo" alt="Flashback Logo" width="200">
                <form id="loginForm">
                    <div class="form-row align-items-center">
                        <div class="offset-md-4 col-md-4 my-2">
                            <p class="form-titles">Username:</p>
                            <label class="sr-only" for="inlineFormInputName">Name</label>
                            <input v-model="input.username" type="text" class="form-control" id="formUsername" required>
                        </div>

                        <div class="offset-md-4 col-md-4 my-2">
                            <p class="form-titles">Password:</p>
                            <label class="sr-only" for="inlineFormPassword">Name</label>
                            <input v-model="input.password" type="password" class="form-control" id="formPassword" required>
                        </div>

                        <div class="offset-md-7 my-2">
                            <button v-on:click.prevent="login()" type="submit" class="btn btn-primary" id="signInBtn">Sign In</button>
                        </div>
                    </div>
                </form>            
            </div>
        </div>
     `,
 
     data() {
         return {
             input: {
                 username: "",
                 password: ""
             },

         }
     },
 
     methods: {
         login() {
            //console.log(this.$parent.mockAccount.username);
 
            if(this.input.username != "" && this.input.password != "") {
            // fetch the user from the DB
            // generate the form data
            let formData = new FormData();

             formData.append("username", this.input.username);
             formData.append("password", this.input.password);

             let url = `./admin/scripts/admin_login.php`;
 
             fetch(url, {
                    method: 'POST',
                    body: formData
                })
                 .then(res => res.json())
                 .then(data => {
                    if (typeof data != "object") { // means that we're not getting a user object back
                        console.warn(data);
                        console.error("authentication failed, please try again");
                        this.$emit("autherror", data);
                    } else {
                        this.$emit("authenticated", true, data[0]);
                        this.$router.replace({ name: "users" });
                    }
                })
             .catch(function(error) { 
                 console.log(error);
             });
        } else {
                 console.log("A username and password must be present");
            }
        }
    }
 }