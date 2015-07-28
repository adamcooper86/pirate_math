//spritely code
$(document).ready(function(){
  $('#wave1').pan({fps: 30, speed: 3, dir: "left"});
  $('#wave2').pan({fps: 30, speed: 2, dir: "left"});
  $('#wave3').pan({fps: 30, speed: 1, dir: "left"});
  $(function(){
    function bob(){
      $('#pirateship').animate({bottom: "+=10"}, 1000)
                      .animate({bottom: "-=10"}, 1000, function(){ bob(); })
    }
    bob();
  });
});

//Practice animations
//call a method every time a user submits a answer
function moveShipLeft(){
  $('#pirateship').animate({left: "+=2.5%", bottom: "+=10"}, 1500)
                  .animate({left: "+=2.5%", bottom: "-=10"}, 1500)
}
//animate it back at the end
