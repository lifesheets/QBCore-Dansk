var playerCount = 0;
var playerId = 0;

$(document).ready(function () {
    window.addEventListener('message', function (event) {
         if (event.data.action == 'setPlayerId') {
            playerId = event.data.id;
        } else if (event.data.action == 'setPlayerCount') {
            playerCount = event.data.spillere;
        }
    });
});

$(function() {
    moment.locale('da-DK');
    function iniciarTidenIRLWatermark() {
      document.getElementById('TidenIRLWatermark').innerHTML = "<h3>" + moment().format(`DD/MM/YYYY HH:mm:ss`) +  "</h3>";
/*      document.getElementById('OnlineOgID').innerHTML = "<h3>Online: " + playerCount +  "/64 - Dit ID: " + playerId + "</h3>";  */
      t = setTimeout(function() {
        iniciarTidenIRLWatermark()
      }, 500);
    }
    iniciarTidenIRLWatermark();
});

var slideIndex = 0;
showSlides();

function showSlides() {
    var i;
    var slides = document.getElementsByClassName("logo");

    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";  
    }
    slideIndex++;
    if (slideIndex > slides.length) {
        slideIndex = 1
    }
    
    slides[slideIndex-1].style.display = "block";  
}
  
