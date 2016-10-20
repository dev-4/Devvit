var elMessage, elMessageCharCount, elConsole;

$(document).ready(function(){
  startTime();
  elMessage = document.querySelector("textarea[name=message]");
  elMessageCharCount = document.getElementById("message-remaining");
  elConsole = document.getElementById("console");
  // Character Count update
  updateRemaining(elMessage,elMessageCharCount);

  elMessage.addEventListener("keydown",function(event){
    // if there's still room to write, update the remaining character count and let them go through

    // console.log( elMessage, elMessageCharCount );
    updateRemaining( elMessage, elMessageCharCount );
    // else, if there's no room, block the letters
  });

  // Takes a number of characters and updates element
function updateRemaining( elInput, elMsg ) {
  var remaining = elInput.getAttribute('maxlength') - elInput.value.length;
  if( remaining >= 0 ) {
    elMsg.innerText = remaining;
    return true;
  } 
  return false;
}