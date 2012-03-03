var is_foucsed = false;

function printError_new(id,error)
{
    if(is_foucsed== false)
   {
        jQuery("#"+id).focus();
        is_foucsed= true;
   }
    if(jQuery("#"+id).next("label").hasClass("error"))
    {
        jQuery("#"+id).next("label").html(error);
    }
    else
    {
        jQuery("#"+id).after("<label class='error'>"+error+"</label>");
    }
}

function validate_user_details_form()
{
    is_foucsed = false;
    var flag = true;
    jQuery(".error").html("");
    var username = jQuery("#user_username").val();
    var password = jQuery("#user_encrypted_password").val();
    var about_me = jQuery("#user_detail_about_me").val();
    var work_history = jQuery("#user_detail_work_info").val();
    var education = jQuery("#user_detail_education").val();
    var internet_interest = jQuery("#user_detail_interest_internet").val();
    var age = jQuery("#user_detail_age").val();

    if(username.length == 0 || username == "admin")
    {
       error="Please enter username."
       printError_new("user_username",error);
       flag=false;

    }
    else
    {
       if(username.indexOf(' ') >= 0)
       {
            error="Username should not contain blank space.";
            printError_new("user_username",error);
            flag=false;
       }
       else
       {
           if(username.length > 50){
                error="Username is too long."
                printError_new("user_username",error);
                flag=false;
           }
       }
     }

    if(password.length==0 || password == "passw"){
       error="Please enter password.";
          printError_new("user_encrypted_password",error);
       flag=false;
     }
     else{
       if(password.indexOf(' ') >= 0)
       {
            error="Password should not contain blank space.";
          printError_new("user_encrypted_password",error);
            flag=false;
       }
       else if(password.length<6){
          error="Password is too short.";
          printError_new("user_encrypted_password",error);
          flag=false;
       }else if(password.length>20){
          error="Password is too long.";
          printError_new("user_encrypted_password",error);
          flag=false;
       }

     }

     if(about_me.length>=0 && about_me.length>200 )
     {
        error="Maximum character limit is 200.";
        printError_new("user_detail_about_me",error);
        flag=false;
     }
     if(work_history.length>=0 && work_history.length>600 )
     {
        error="Maximum character limit is 600.";
        printError_new("user_detail_work_info",error);
        flag=false;
     }
     if(education.length>=0 && education.length>600 )
     {
        error="Maximum character limit is 600.";
        printError_new("user_detail_education",error);
        flag=false;
     }
     if(internet_interest.length>=0 && internet_interest.length>600 )
     {
        error="Maximum character limit is 600.";
        printError_new("user_detail_interest_internet",error);
        flag=false;
     }
     if(age.length>0 && !jQuery.isNumeric(age))
     {
        error="Please enter numeric value.";
        printError_new("user_detail_age",error);
        flag=false;
     }


     if(flag==false)
     {
         jQuery("#user_encrypted_password").val("");
     }

     return flag;
}

