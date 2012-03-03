function checkSignupValidation(){
 var username=document.getElementById("user_name").value;
 var email=document.getElementById("user_email").value;
 var password=document.getElementById("user_password").value;
 printError("username_error", '');
 printError("email_error", '');
 printError("password_error", '');
 if (validateSignup(username, email, password)){
    document.getElementById("user_password").value = "";
    return false;
 }
}

function validateSignup(username, email, password ){

 var flag=false;
 var specialCharRegExp = /^([A-Za-z0-9 ]+)$/;
 var specialCharRegExpBuisness=/^([A-Za-z0-9 ]+)$/;
 var emailRegExp=/^([a-zA-Z0-9_.-])+@([a-zA-Z0-9_.-])+\.([a-zA-Z])+([a-zA-Z])+/; 
 var numericExp=/[+-]?((\d+(\.\d*)?)|\.\d+)([eE][+-]?[0-9]+)?/;
 var stringExp=/[a-zA-Z' ']/;
 var phoneExp=/^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$/;
 var zipExp=/^\d{5}([\-]\d{4})?$/;
 //[^a-zA-Z0-9_]
 if(username.length == 0 || username == "admin"){ 
   error="Please enter username."
   printError("username_error",error);
   flag=true;
	
 }
 else
{
   if(username.indexOf(' ') >= 0)
   {
        error="Username should not contain blank space.";
        printError("username_error",error);
        flag=true;
   }
   else
   {
       if(username.length > 50){
            error="Username is too long."
            printError("username_error",error);
            flag=true;
       }
   }
 }

 if(jQuery.trim(email).length==0 || email == "abc@abc.com"){
   error="Please enter email.";
   printError("email_error",error);
   flag=true;
 }
 else{
   if(!email.match(emailRegExp) ){
     error="Please enter valid email.";
     printError("email_error",error);
     flag=true;
   }else{
     if(email != email.toLowerCase() ){
       error="Use only lower case for Email.";
       printError("email_error",error);
       flag=true;
     }}
 }

 if(email.length>100){
   error="Email is too long.";
   printError("email_error",error);
   flag=true;
 }

 if(password.length==0 || password == "passw"){
   error="Please enter password.";
   printError("password_error",error);
   flag=true;
 }
 else{
   if(password.indexOf(' ') >= 0)
   {
        error="Password should not contain blank space.";
        printError("password_error",error);
        flag=true;
   }
   else if(password.length<6){
      error="Password is too short.";
      printError("password_error",error);
      flag=true;
   }else if(password.length>20){
      error="Password is too long.";
      printError("password_error",error);
      flag=true;
   }

 }

 if(flag==true){
   return flag;
 }

}



function checkSigninValidation(){
 var username=document.getElementById("user_loginname").value.trim();
 var password=document.getElementById("user_loginpassword").value;
 if (validateSignin(username, password)){
    return false;
 }
}

function validateSignin(username, password ){
  var flag=false;
  if(username.length == 0 || username == "Enter the username"){ 
    error="Please enter username.";
    printError("login_username_error",error);
    flag=true;
	
   }
  if(password.length == 0 || password == "passw"){ 
    error="Please enter password.";
    printError("login_password_error",error);
    flag=true;
	
   }
 if(flag==true){
   return flag;
 }
}













