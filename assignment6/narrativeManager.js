// this object is to keep track of narrative beats and unlocks

// each "beat" has a test function, a function which unlocks elements, and a report function

// events to add - rats eat food, troops die in plauge, bandits steal money, enemies that survived steal back a territory, ghosts of enemies scare away troops and prices increase, dead troops increase risk that you cant buy any troops

const narrativeManager = class {
  constructor(parentObject) {
  this.data = parentObject;
    console.log(parentObject, this.data)
    
  this.beats = [
  {
    triggered: false,
    test: function(data){return data.troops >= 1}, 
    unlock:function(){io.showElement("showPanel2");io.showElement("ConquestTable")},  
    report: function(){io.appendIntoElement("You've aquired enough troops to begin your conquest.", "reports");}
  },
  {
    triggered: false,
    test: function(data){return data.troopsLost >= 1},
    unlock: function(){io.showElement("troopsLostRow");},
    report: function(){}
  }
  ]
  }
  
  setup(){
    io.hideElement("showPanel2")
    io.hideElement("ConquestTable")
    io.hideElement("troopsLostRow")
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