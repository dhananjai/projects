/* Function to check validation for Url in discussion*/
function check_url()
{
 var url = document.getElementById("discussion_url").value;
 if(url!="" && !url.match(/^(ht|f)tps?:\/\//))
 {
    url= "http://"+url;
    jQuery("#discussion_url").val(url);
   
 }
 if(validate_url(url)==true){
   return false;
 }
}

function validate_url(url){
 error_blank_url();
 var flag=false;
 var urlRegExp = /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/;
 if(url.length==0)
 {
   error="Please enter url."
   printError("urlError",error);
   flag=true;
 }
 else
 {
   if(url.length>300)
   {
   	error="Url is too long."
  	printError("urlError",error);
   	flag=true;
   }
 }
  if(url.length!=0)
  {
      if(!url.match(urlRegExp))
      {
 	   error="Please enter valid url."
 	   printError("urlError",error);
 	   flag=true;
      }
  }

 if(flag==true)
 {
   return flag;
 }
}

function error_blank_url()
{
   document.getElementById("urlError").innerHTML="";
}
