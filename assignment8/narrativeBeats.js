
  // store your narrative beats and functions herenarrativeBeasts =   
beats = [
  
    {
      triggered: false,
      test: function(manager, data){ return data.timeElapsed > 60 }, 
      unlock: function(manager, data){ manager.setPhase("phase2"); data.shakeEnabled = true; data.shakeIntensity = 1; data.textAdditionIntensity += 0.5; data.textFlickerIntensity += 0.1;  },
      report: function(manager, data){ return }
    },

    {
      triggered: false,
      test: function(manager, data){ return data.timeElapsed > 120 }, 
      unlock: function(manager, data){ manager.setPhase("phase3"); data.shakeTime = 80; data.shakeIntensity = 5; data.scrollIntensity += 1; data.textAdditionIntensity += 0.1; data.textFlickerIntensity += 0.2;},
      report: function(manager, data){ return }
    },

    {
      triggered: false,
      test: function(manager, data){ return data.timeElapsed > 180 }, 
      unlock: function(manager, data){ manager.setPhase("phase4"); data.shakeTime = 60; data.shakeIntensity = 10; data.scrollIntensity += 1; data.textAdditionIntensity += 0.1; data.textFlickerIntensity += 0.2; },
      report: function(manager, data){ return }
    },

    {
      triggered: false,
      test: function(manager, data){ return data.timeElapsed > 240 }, 
      unlock: function(manager, data){ manager.setPhase("phase5"); data.shakeTime = 40; data.shakeIntensity = 50; data.scrollIntensity += 1; data.textAdditionIntensity += 0.1; data.textFlickerIntensity += 0.2; },
      report: function(manager, data){ return }
    },

    {
      triggered: false,
      test: function(manager, data){ return data.timeElapsed > 300 }, 
      unlock: function(manager, data){ manager.setPhase("phase6"); data.shakeIntensity = 100; data.scrollIntensity += 1; data.textAdditionIntensity += 0.1; data.textFlickerIntensity += 0.2; },
      report: function(manager, data){ return }
    },

    {
      triggered: false,
      test: function(manager, data){ return document.title ==="THE OUTSIDER - PAGE 4" }, 
      unlock: function(manager, data){ data.startPageScroll = true; },  
      report: function(manager, data){return}
    },

    {
      triggered: false,
      test: function(manager, data){ return document.title ==="THE OUTSIDER - PAGE 6" }, 
      unlock: function(manager, data){ data.startTextAddition = true; },  
      report: function(manager, data){return}
    },

    {
      triggered: false,
      test: function(manager, data){ return document.title ==="THE OUTSIDER - PAGE 3" }, 
      unlock: function(manager, data){ data.startTextFlicker = true; },  
      report: function(manager, data){return}
    },

    {
      triggered: false,
      test: function(manager, data){ return document.title ==="THE OUTSIDER - PAGE 5" }, 
      unlock: function(manager, data){ data.enableFlickerMouse = true; },  
      report: function(manager, data){return}
    },

  ]
  