const hauntings = class {

  // code for this function obtained from: https://jsfiddle.net/6r4k0son/
  static shakeText(time, coefficient) {
    let shakeText = document.getElementsByClassName("shakeText");
    for (let x = 0; x < shakeText.length; x++) {
      shakeText[x].style.transition = "0.1s";
      setInterval(function(){
          var randomInt1 = Math.floor((Math.random() * 3) + 1);
          var randomInt2 = Math.floor((Math.random() * 3) + 1);
          var randomInt3 = Math.floor((Math.random() * 2) + 1);
          
          var phase1 = (randomInt1 % 2) == 0 ? "+" : "-";
          var phase2 = (randomInt2 % 2) == 0 ? "+" : "-";
          var phase3 = (randomInt3 % 2) == 0 ? "+" : "-";
          
          var transitionX = ((phase1 + randomInt1) * (coefficient / 10)) + "px";
          var transitionY = ((phase2 + randomInt2) * (coefficient / 10)) + "px";
          var rotate = ((phase3 + randomInt3) * (coefficient / 10)) + "deg";

          shakeText[x].style.webkitTransform = "translate("+transitionX+","+transitionY+") rotate("+rotate+")";
      }, time);
    }
  }

  static pageScroll(data, intensity) {
    if (data.startPageScroll) {
      let storyText = document.getElementsByClassName("storyText");
      for (let x = 0; x < storyText.length; x++) {
        let updatedHTML = storyText[x].innerHTML;
        for (let y = 0; y < intensity; y++ ) {
          updatedHTML = "<br>" + updatedHTML;
        }
        storyText[x].innerHTML = updatedHTML;
      }
    }
  }

  static textAddition(data, intensity) {
    if (data.startTextAddition) {
      let phrases = ['<span id="shaky" class="shakeText"><strong>OUTSIDER</strong></span>', '<span id="shaky" class="shakeText"><strong>MONSTER</strong></span>', '<span id="shaky" class="shakeText"><strong>ABOMINATION</strong></span>'];
      let paragraphs = document.getElementsByTagName("p");
      for (let x = 0; x < paragraphs.length; x++){
        console.log(intensity);
        if (Math.random() < intensity) {
          let newInnerHTML = paragraphs[x].innerHTML;
          if (Math.random() < 0.5 ) {
            newInnerHTML = newInnerHTML + phrases[Math.floor(Math.random()*phrases.length)];
          }
          else {
            newInnerHTML = phrases[Math.floor(Math.random()*phrases.length)] + newInnerHTML;
          }
          paragraphs[x].innerHTML = newInnerHTML;
        }
      }
  }
  }
  
  static flickerText(intensity, flicker){
    if (flicker) {
      let flickerText = document.getElementsByClassName("flickerText");
      for (let x = 0; x < flickerText.length; x++) {
        if (Math.random() < intensity) {
          flickerText[x].style.fontSize = (Math.random() *125 + 75) + "%";
        }
        else {
          flickerText[x].style.fontSize = "100%";
        }
      }
    }
  }

  static flickerMouse(data) {
    if (data.enableFlickerMouse) {
      var x = document.getElementsByTagName("*"); 
      for (let i = 0; i < x.length; i++) {
        if (Math.random() > 0.5) {
          x[i].style.cursor = "none";
        }
        else {
          x[i].style.cursor = "auto";
        }
      }
    }
  }


    

}