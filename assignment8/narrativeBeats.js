
  // store your narrative beats and functions herenarrativeBeasts =   
beats = [



  {
    triggered: false,
    test: function(manager, data){        return data.elapsedTime > 60   }, 
    unlock: function(manager, data){      data.intensity = 0.1;          },  
    report: function(manager, data){return}
  },
  
    {
    triggered: false,
    test: function(manager, data){        return data.timeElapsed > 120   }, 
    unlock: function(manager, data){      manager.setPhase("phase2");
                                          data.intensity = 0.3;},  
    report: function(manager, data){return}
  },
  
    {
    triggered: false,
    test: function(manager, data){        return data.timeElapsed > 240   }, 
    unlock: function(manager, data){      manager.setPhase("phase3")
                                          data.intensity = 0.9;},  
    report: function(manager, data){return}
  },
  
    {
    triggered: false,
    test: function(manager, data){        return document.title ==="WHALE FACTS; Cetology" }, 
    unlock: function(manager, data){      data.startWordReplacement = true;},  
    report: function(manager, data){return}
  },
  
    {
    triggered: false,
    test: function(manager, data){        return document.title ==="WHALE PICS" }, 
    unlock: function(manager, data){      data.startImageFlicker = true;},  
    report: function(manager, data){return}
  },
  ]
  