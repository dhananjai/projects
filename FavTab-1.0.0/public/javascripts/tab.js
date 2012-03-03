
/* Deepali Thaokar  #06/01/2012*/
/* Function to open a all urls of tab */

function openWindows(site_urls) {
            var windows = [], i = 0;
            var web = site_urls.split(' ');
            for(var j= 0; j<=web.length-1; j++){
             var url = web[j];              
             if (url) {
                // Check if the URL contains "http://" in the string
                // If it doesn't force "http://" to the front of the URL
                if (!url.match(/^(http(s)?):\/\//i)) {
                    url = 'http://' + url;
                }
                
                // Make sure the url has a length of at least 1 or else
                // do nothing
                if (url.length) {
                    windows[i] = window.open(url, 'tabWindow_' + i);
                    i++;
                }
            } else {
                alert('No URL Found');
            }
         }
        
}
/* Function to open a all urls of tab  end*/
/**************************************************************************************/
/* Function to check validation for Tabname*/
function check_tab()
{
 var tab_name = document.getElementById("tab_name").value;
 if(validate_tab(tab_name)){
   return false;
 }
}

function validate_tab(tab_name){
error_blank_tab();
 var flag=false;
 if(tab_name.length==0 || jQuery.trim(tab_name).length==0)
 {
   error="Please enter tabname."
   printError("tabNameError",error);
   flag=true;
 }
 else
 {
   if(tab_name.length>50)
   {
   	error="Tabname is too long."
  	printError("tabNameError",error);
   	flag=true;
   }
 }

 if(flag==true)
 {
   return flag;
 }
}

function error_blank_tab()
{
   document.getElementById("tabNameError").innerHTML="";
}

/* Function to check validation for Tabname end*/
/**************************************************************************************/
/* Function to check validation for site url under tab*/
function check_tab_site()
{
 var site_url = document.getElementById("site_site_url").value;
 if(site_url !="" && !site_url.match(/^(ht|f)tps?:\/\//))
 {
    site_url= "http://"+site_url;
    jQuery("#site_site_url").val(site_url);

 }
 if(validate_tab_site(site_url)){
   return false;
 }
}

function validate_tab_site(site_url){
 error_blank_tab_site();
 var flag=false;
 var tabRegExp = /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/;
 if(site_url.length==0)
 {
   error="Please enter site url."
   printError("siteurlError",error);
   flag=true;
 }
 else
 {
   if(site_url.length>300)
   {
   	error="Tabname is too long."
  	printError("siteurlError",error);
   	flag=true;
   }
 }
  if(site_url.length!=0)
  {
      if(!site_url.match(tabRegExp))
      {
 	   error="Please enter valid url."
 	   printError("siteurlError",error);
 	   flag=true;
      }
  }

 if(flag==true)
 {
   return flag;
 }
}

function error_blank_tab_site()
{
   document.getElementById("siteurlError").innerHTML="";
}

/* Function to check validation for site url under tab end*/
/**************************************************************************************/
/* Function to check validation for current tab */
function check_current_tab()
{
 var site_urls = document.getElementById("current_tab_site_url").value;
 if(validate_current_tab(site_urls)){
   return false;
 }
}

function validate_current_tab(site_urls){
 error_blank_current_tab();
 var flag=false;
 if(site_urls.length==0)
 {
   error="Please enter urls."
   printError("currenturlError",error);
   flag=true;
 }
 if(flag==true)
 {
   return flag;
 }
}

function error_blank_current_tab()
{
   document.getElementById("currenturlError").innerHTML="";
}
/* Function to check validation for current tab end*/
