// this object is to keep track of narrative beats and unlocks

// each "beat" has a test function, a function which unlocks elements, and a report function

const narrativeManager = class {
  constructor() {
    this.data = {
      timeElapsed : 0,
      possiblePhases : ["phase1", "phase2", "phase3", "phase4", "phase5", "phase6"],
      phase : "phase1",
      beats : beats,
      beatsTriggered: [],
      
      pagesVisited: {},

      shakeTime: 100,
      shakeIntensity: 0,
      scrollIntensity: 1,
      textAdditionIntensity: 0.05,
      textFlickerIntensity: 0.1,

      shakeEnabled: false,
      startPageScroll: false,
      startTextAddition: false,
      startTextFlicker: false,
   
    }

    // variables that are reset upon page reload
    this.localTime = 0;
    this.timeToStart = Math.random() * 5;

    for (let x in this.data.beats)
    this.data.beatsTriggered.push(false)
  }

  
  
  
  
  // use this function to set up any variables and timers 
  run(){
    this.setAllElementsToCurrentPhase();
    
    self = this;
    this.mainInterval = setInterval(function(){
      self.loop()
      self.save()
      }, 1000)
    
     
  }

  // goes through all narrative events, checks if they activate, runs activation code, and runs code that delivers a message about the story event
  assess(){
    beats = this.data.beats
    //console.log( this.data.beatsTriggered)
    let beats_triggered = this.data.beatsTriggered;
    for (let b = 0; b < beats.length; b++){
      let beat = beats[b]
      
      if (!beats_triggered[b]){
//console.log(b)
        if (beat.test(this, this.data)){
          beat.triggered = true;
          beats_triggered[b] = true;
          beat.unlock(this, this.data);
          beat.report(this, this.data);
        }
      }
    }
  }
  
  setPhase(phase){
    this.data.phase = phase;
    this.setAllElementsToCurrentPhase()
  }
  
  setPhaseOnElement(htmlElement){   
    for (let p = 0; p <this.data.possiblePhases.length; p++) {
      
      htmlElement.classList.remove(this.data.possiblePhases[p]);
    }
    
    htmlElement.classList.add(this.data.phase)
  }
  
  setAllElementsToCurrentPhase(){
    let pageElements = document.getElementsByTagName("*")
      for (let x = 0; x < pageElements.length; x++){
        if (pageElements[x].parentElement !== null)
        {
          if (pageElements[x].parentElement.tagName == "BODY"){
            this.setPhaseOnElement(pageElements[x])
          }
          this.setPhaseOnElement(document.getElementsByTagName("body")[0])
        }
    }
  }
  
  save(){
    console.log("save_attempted")
    window.localStorage.setItem("hauntedData", JSON.stringify(this.data))
  }
  
  canLoad(){
    return window.localStorage.getItem("hauntedData") !== null
  }
  
  load(){
    this.data = JSON.parse(window.localStorage.getItem("hauntedData"))
    this.setAllElementsToCurrentPhase()
  }
  
  reset(){
    console.log("RESET");
    this.data = new narrativeManager().data;
  }
  

  loop(){

      this.data.timeElapsed += 1;
      this.localTime += 1;

      if (this.data.shakeEnabled && this.localTime > this.timeToStart) {
        hauntings.shakeText(this.data.shakeTime, this.data.shakeIntensity);
      }

      if (this.localTime > this.timeToStart && (this.data.timeElapsed % 2 == 0)) {
        hauntings.pageScroll(this.data, this.data.scrollIntensity);
      }

      if (this.localTime > this.timeToStart) {
        hauntings.textAddition(this.data, this.data.textAdditionIntensity);
        hauntings.flickerText(this.data.textFlickerIntensity, this.data.startTextFlicker);
      }
        
      this.assess();
      
  }
  
  

}