const GameInstance = class {
  constructor() {
    this.narrativeManager = new narrativeManager(this)
    
    this.stages = ["stage1"];
    this.currentStage = "stage1"; 
    this.panels = {
      "stage1": ["panel1", "panel2"],
    }
    this.currentPanel = "panel1";

    this.funds = 0;
    this.fundsIncrement = 1;
    this.foodSupply = 0;
    this.foodCost = 5;
    this.troops = 0;
    this.troopsCost = 10;
    this.foodNeed = 1;
    this.troopsLost = 0;
      
    //this.collectorsProtected = 0;
    //this.findersProtected = 0;
    //this.gardenCollectors = 0;
    
  }
  
  

  
  // the following functions are to be called from buttons in the index.html
  increaseFunds() { 
    this.funds += this.fundsIncrement; 
    this.updateDisplay();
  }

  purchaseFood(){ 
    if ((this.funds - this.foodCost) >= 0) {
      this.foodSupply += 1; 
      this.funds -= this.foodCost;
    }
    else {
      io.appendIntoElement("Not enough funds", "reports");
    }
    this.updateDisplay();
  }

  purchaseTroops() {
    if ((this.funds - this.troopsCost) >= 0) {
      this.troops += 1; 
      this.funds -= this.troopsCost;
    }
    else {
      io.appendIntoElement("Not enough funds", "reports");
    }
    this.updateDisplay();
  }

  feedTroops() {
    if (this.foodSupply - (this.troops * this.foodNeed) >= 0) {
      this.foodSupply -= (this.troops * this.foodNeed);
    }
    else {
      let over = (this.troops * this.foodNeed) - this.foodSupply;
      let died = Math.ceil(over / this.foodNeed);
      this.troops -= died;
      this.foodSupply -= (this.troops * this.foodNeed);
      io.appendIntoElement(died+" of your troops starved to death", "reports");
    }
    this.updateDisplay();
  }
    
  // this function takes in a panel 
  swichPanels(panel) {
    game.currentPanel = panel;
    io.showPanel(game);    
  }
  
  updateDisplay(){
    io.writeValueIntoClass(this.funds, "currentFunds")
    io.writeValueIntoClass(this.foodSupply, "currentFoodSupply")
    io.writeValueIntoClass(this.foodCost, "foodCost")
    io.writeValueIntoClass(this.troops, "currentTroops")
    io.writeValueIntoClass(this.troopsCost, "curentTroops")
    io.writeValueIntoClass(this.troopsCost, "troopsCost")
  }
  
};


// this function forom JQuery waits until the web page is fully loaded before triggering the start of the game
$( document ).ready(function() {
  game = new GameInstance();
  game.narrativeManager.setup();
  
  io.showStage(game); 
  game.updateDisplay()

  startRecording(game);

  // Run the Loop
  gameTimer = setInterval(function(){
    game.increaseFunds()
    game.narrativeManager.assess()
    game.updateDisplay()
}, 500)
gameTimer = setInterval(function() {
  game.feedTroops()
}, 10000)
  

})
