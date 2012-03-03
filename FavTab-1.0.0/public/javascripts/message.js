  function checkMessageValidation(){
   var to =document.getElementById("recievers_text_box").value;
   var msg =document.getElementById("message_message").value;
  if (validateMessage(msg, to)){
    return false;
 }
}

function validateMessage(msg, to ){
  var flag=false;
  if(msg.length == 0 || msg == "Enter the message"){
    error="Please enter some message."
    printError("msg_error",error);
    flag=true;

   }
 if(msg.length>2000){
   error="Message is too long."
   printError("msg_error",error);
   flag=true;
 }
 if(to.length == 0 || to == ""){ 
    error="Please enter username."
    printError("to_error",error);
    flag=true;
	
   }
 
 if(flag==true){

   return flag;
 }
 else
 {
   jQuery(".error").html("");
 }
}

