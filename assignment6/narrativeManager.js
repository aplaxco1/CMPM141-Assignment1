// this object is to keep track of narrative beats and unlocks

// each "beat" has a test function, a function which unlocks elements, and a report function

const narrativeManager = class {
  constructor(parentObject) {
  this.data = parentObject;
    console.log(parentObject, this.data)
    
  this.beats = [
  {
    triggered: false,
    test: function(data){return data.troops >= 1}, 
    unlock:function(){io.showElement("showPanel2")},  
    report: function(){io.appendIntoElement("You unlocked a new dimension of management", "reports");}
  },
  ]
  }
  
  setup(){
    io.hideElement("showPanel2")
  }


// goes through all narrative events, checks if they activate, runs activation code, and runs code that delivers a message about the story event
  assess(){
    for (let b = 0; b < this.beats.length; b++){
      let beat = this.beats[b]
      if (!beat.triggered){
        if (beat.test(this.data)){
          beat.triggered = true;
          beat.unlock();
          beat.report();
        }
      }
    }
  }

}