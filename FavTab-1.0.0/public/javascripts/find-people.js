function checkFindPeopleValidation(){
 var fromAge = document.getElementById("user_age_from").value
 var toAge = document.getElementById("user_age_to").value
 
 if (validateFindPeople(fromAge, toAge)){
    return false;
 }
}

function validateFindPeople(fromAge, toAge){
 if (fromAge.length == 0 && toAge.length == 0 ){
   return false;
 }else{
 if(!jQuery.isNumeric(fromAge) || !jQuery.isNumeric(fromAge))
{
    display_flash_message("Age must be numeric.");
    return true;
}
 else
{if (fromAge.length == 0 || toAge.length == 0 ) {
   display_flash_message("Please select the Age")
   return true;
 }else{
    if(parseInt(fromAge) > parseInt(toAge)){ 
      display_flash_message("From Age must not be greater than to Age")
      return true;
    }
 }}
}

 return false;
}
