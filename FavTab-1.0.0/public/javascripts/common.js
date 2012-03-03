// Place your application-specific JavaScript functions and classes here

function printError(targetAreaId,errorMsg){
  document.getElementById(targetAreaId).innerHTML= errorMsg;
}

// function for showing error message at top code starts here
function displayFlash(msg)
{
  
  displayCustomError(msg, '#FF0000')
}

function displayError(msg)
{
  displayCustomError(msg, '#FF0000')
}
// function for showing error message at top code starts here
function displayCustomError(msg, color)
{
  document.getElementById("msgError").innerHTML = msg;
  jQuery(function($){
     var browserWidth = document.body.offsetWidth;
     var divWidth = jQuery("#msgError").width();
     var marginLeft = (browserWidth - divWidth)/2 
     jQuery("#msgError").css("margin-left", marginLeft+"px");
     jQuery(".msg-td").css("background-color", color);
     //jQuery(".r0").css("background-color", color);
  });
  document.getElementById("msgError").style.display = 'block';
  jQuery("html, body").animate({ scrollTop: 0 }, "slow");
  setTimeout('jQuery("#msgError").fadeOut(["slow"]);', 6000);
} 
