const strengthMax = 30;
const moraleMax = 25;

const GameInstance = class {
  constructor() {
    this.narrativeManager = new narrativeManager(this)
    
    this.stages = ["stage1"];
    this.currentStage = "stage1"; 
    this.panels = {
      "stage1": ["panel1", "panel2"],
    }
    this.currentPanel = "panel1";

    // troop management stuff
    this.funds = 0;
    this.fundsIncrement = 2;
    this.foodSupply = 0;
    this.foodCost = 5;
    this.foodIncrement = 0;
    this.troops = 0;
    this.troopsCost = 10;
    this.foodNeed = 1;
    this.troopsLost = 0;

    this.enemiesDefeated = 0;
    this.enemiesSurvived = 0; // use for events? like how likely you are to lose certain lands at random intervals (calculated based on percantage of your troops?)
    
    // battle management stuff
    this.pointsEarned = 0;
    this.morale = 0;
    this.strength = 1;
    this.castlesConquered = 0;
    this.fortressesConquered = 0;
    this.townsConquered = 0;
    this.farmlandsConquered = 0;
    
  }
  
  // the following functions are to be called from buttons in the index.html
  increaseFunds() { 
    this.funds += this.fundsIncrement; 
    this.updateDisplay();
  }

  increaseFood() {
    this.foodSupply += this.foodIncrement;
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
      this.troopsLost += died;
      io.appendIntoElement(died+" of your troops starved to death", "reports");
    }
    this.updateDisplay();
  }

  increaseStrength() {
    if (this.pointsEarned >= 1) {
      this.strength += 1;
      this.pointsEarned -= 1;
      io.appendIntoElement("Your troops have become stronger", "reports");
      this.updateDisplay();
    }
    else {
      io.appendIntoElement("Not enough experience points", "reports");
    }
  }

  increaseMorale() {
    if (this.pointsEarned >= 1) {
      this.morale += 1;
      this.pointsEarned -= 1;
      io.appendIntoElement("You have increased morale amoung your troops", "reports");
      this.updateDisplay();
    }
    else {
      io.appendIntoElement("Not enough experience points", "reports");
    }
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
    io.writeValueIntoClass(this.troopsLost, "totalTroopsLost")
    io.writeValueIntoClass(this.troopsCost, "troopsCost")
    io.writeValueIntoClass(this.strength, "currentStrength")
    io.writeValueIntoClass(this.morale, "currentMorale")
    io.writeValueIntoClass(this.pointsEarned, "points")
    io.writeValueIntoClass(this.castlesConquered, "totalCastles")
    io.writeValueIntoClass(this.fortressesConquered, "totalFortresses")
    io.writeValueIntoClass(this.townsConquered, "totalTowns")
    io.writeValueIntoClass(this.farmlandsConquered, "totalFarmlands")
  }
  
};

const FarmlandsClass = class {
  constructor() {
    let troopsUpperLimit = 4;
    if (game.farmlandsConquered > 0) { troopsUpperLimit = 4 + game.farmlandsConquered }
    let troopsLowerLimit = 2;
    if (game.farmlandsConquered > 0) { troopsLowerLimit = 2 + game.farmlandsConquered }
    this.troops = randomInt(troopsLowerLimit, troopsUpperLimit);
    let moraleUpperLimit = 1 + Math.ceil(game.farmlandsConquered / 2);
    let moraleLowerLimit = 0 + Math.ceil(game.farmlandsConquered / 2);
    this.morale = randomInt(moraleLowerLimit, moraleUpperLimit);
    let strengthUpperLimit = 1 + Math.ceil(game.farmlandsConquered / 2);
    let strengthLowerLimit = 1;
    if (game.farmlandsConquered > 0) { strengthLowerLimit = Math.ceil(game.farmlandsConquered / 2); }
    this.strength = randomInt(strengthLowerLimit, strengthUpperLimit);

    this.troopsAssigned = 0;
    this.battleRunning = false;

    this.time = 2 * this.troops;

    io.hideElement("farmlandTimer");
    io.hideElement("farmlandTimerNum");
  }

  addTroops() {
    if (!this.battleRunning) {
      if (this.troopsAssigned < game.troops) {
        this.troopsAssigned += 1;
      }
      else if (this.troopsAssigned == game.troops) {
        this.troopsAssigned = 0;
      }
      this.updateDisplay();
    }
  }

  removeTroops() {
    if (!this.battleRunning) {
      if (this.troopsAssigned > 0) {
        this.troopsAssigned -= 1;
      }
      else if (this.troopsAssigned == 0) {
        this.troopsAssigned = game.troops;
      }
      this.updateDisplay();
    }
  }

  startBattle(){
    if (!this.battleRunning) {
      console.log(game.troops);
      if (this.troopsAssigned <= game.troops && this.troopsAssigned != 0) {
        this.battleRunning = true;
        game.troops -= this.troopsAssigned;
        game.updateDisplay();
        io.appendIntoElement("You have sent "+this.troopsAssigned+" of your troops out to conquer a farmland", "reports");
      }
      else {
        if (this.troopsAssigned == 0) { io.appendIntoElement("No troops assigned", "reports"); }
        else { io.appendIntoElement("Not enough troops", "reports"); }
      }
    }
  }

  runBattle() {
    if (this.battleRunning) {
      io.showElement("farmlandTimer");
      io.showElement("farmlandTimerNum");
      let success;
      let troopsSurvived;
      let troopsLost;
      let enemiesSurvived;
      let enemiesDefeated;
      let result = (this.troopsAssigned * game.strength) - (this.troops * this.strength);
      if (result > 0) {
        success = 1;
        // calculate player troops
        troopsSurvived = Math.ceil(result / game.strength);
        troopsLost = this.troopsAssigned - troopsSurvived;
        troopsSurvived += Math.floor(troopsLost * (game.morale / moraleMax));
        troopsLost = this.troopsAssigned - troopsSurvived;
        // calculate enemy troops
        enemiesSurvived = Math.floor(this.troops * (this.morale / moraleMax));
        enemiesDefeated = this.troops - enemiesSurvived;
      }
      else if (result < 0) {
        success = -1;
        // calculate player troops
        troopsSurvived = Math.floor(this.troopsAssigned * (game.morale / moraleMax));
        troopsLost = this.troopsAssigned - troopsSurvived;
        // calculate enemy troops
        enemiesSurvived = -1 * Math.ceil(result / this.strength);
        enemiesDefeated = this.troops - enemiesSurvived;
        enemiesSurvived += Math.floor(troopsLost * (this.morale / moraleMax));
        enemiesDefeated = this.troops - enemiesSurvived;
      }
      else {
        success = 0;
        // calculate player troops
        troopsSurvived = Math.floor(this.troopsAssigned * (game.morale / moraleMax));
        troopsLost = this.troopsAssigned - troopsSurvived;
        // calculate enemy troops
        enemiesSurvived = Math.floor(this.troops * (this.morale / moraleMax));
        enemiesDefeated = this.troops - enemiesSurvived;
      }

      if (this.time > 0) {
        this.time -= 1;
        this.updateDisplay();
      } else {
        // add a cute tracery thingy here to describe the battle idk (depending on success or failure)
        let string = "";
        if (success == 1) {
          string += "You won the battle over the farmlands. ";
          game.farmlandsConquered += 1;
          if (game.farmlandsConquered == 1) {
            string += "With these new farmlands, your food production has increased. ";
            game.foodIncrement += 1;
          }
          if (game.farmlandsConquered % 3 == 0) {
            string += "With these new farmlands, your food production has increased. ";
            game.foodIncrement += 1;
          }
          if (game.farmlandsConquered % 4 == 0) {
            game.foodNeed += 1;
            game.foodCost += 5;
          }
          if (game.farmlandsConquered % 5 == 0) {
            game.pointsEarned += 1;
          }
        }
        else if (success == -1) {
          string += "You lost the battle over the farmlands. ";
        }
        else {
          string += "Both forces in the battle over the farmlands were wiped out. ";
        }
        string += troopsSurvived+" of your troops returned from the battle, with a total of "+troopsLost+" losses. ";
        string += "You defeated "+enemiesDefeated+" of the enemy troops, but "+enemiesSurvived+" managed to escape with their lives.";
        io.appendIntoElement(string, "reports");
        game.troops += troopsSurvived;
        game.troopsLost += troopsLost;
        game.enemiesSurvived += enemiesSurvived;
        game.enemiesDefeated += enemiesDefeated;
        currFarmland = new FarmlandsClass();
        currFarmland.updateDisplay();
        game.updateDisplay();
      }
    }
  }

  updateDisplay() {
    io.writeValueIntoClass(this.troops, "farmlandTroops");
    io.writeValueIntoClass(this.morale, "farmlandMorale");
    io.writeValueIntoClass(this.strength, "farmlandStrength");
    io.writeValueIntoClass(this.troopsAssigned, "farmlandAssignedTroops");
    io.writeValueIntoClass(this.time, "farmlandTime");
  }

}

const TownClass = class {
  constructor() {
    let troopsUpperLimit = 7;
    if (game.townsConquered > 0) { troopsUpperLimit = 7 + game.townsConquered }
    let troopsLowerLimit = 3;
    if (game.townsConquered > 0) { troopsLowerLimit = 3 + game.townsConquered }
    this.troops = randomInt(troopsLowerLimit, troopsUpperLimit);
    let moraleUpperLimit = 4 + Math.ceil(game.townsConquered / 2);
    let moraleLowerLimit = 2 + Math.ceil(game.townsConquered / 2);
    this.morale = randomInt(moraleLowerLimit, moraleUpperLimit);
    let strengthUpperLimit = 1 + game.townsConquered;
    let strengthLowerLimit = 1;
    if (game.townsConquered > 0) { strengthLowerLimit = game.townsConquered; }
    this.strength = randomInt(strengthLowerLimit, strengthUpperLimit);

    this.troopsAssigned = 0;
    this.battleRunning = false;
    this.reward = Math.ceil(this.troops / 2);

    this.time = 2 * this.troops;

    io.hideElement("townTimer");
    io.hideElement("townTimerNum");
  }

  addTroops() {
    if (!this.battleRunning) {
      if (this.troopsAssigned < game.troops) {
        this.troopsAssigned += 1;
      }
      else if (this.troopsAssigned == game.troops) {
        this.troopsAssigned = 0;
      }
      this.updateDisplay();
    }
  }

  removeTroops() {
    if (!this.battleRunning) {
      if (this.troopsAssigned > 0) {
        this.troopsAssigned -= 1;
      }
      else if (this.troopsAssigned == 0) {
        this.troopsAssigned = game.troops;
      }
      this.updateDisplay();
    }
  }

  startBattle(){
    if (!this.battleRunning) {
      if (this.troopsAssigned <= game.troops && this.troopsAssigned != 0) {
        this.battleRunning = true;
        game.troops -= this.troopsAssigned;
        game.updateDisplay();
        io.appendIntoElement("You have sent "+this.troopsAssigned+" of your troops out to conquer a town", "reports");
      }
      else {
        if (this.troopsAssigned == 0) { io.appendIntoElement("No troops assigned", "reports"); }
        else { io.appendIntoElement("Not enough troops", "reports"); }
      }
    }
  }

  runBattle() {
    if (this.battleRunning) {
      io.showElement("townTimer");
      io.showElement("townTimerNum");
      let success;
      let troopsSurvived;
      let troopsLost;
      let enemiesSurvived;
      let enemiesDefeated;
      let result = (this.troopsAssigned * game.strength) - (this.troops * this.strength);
      if (result > 0) {
        success = 1;
        // calculate player troops
        troopsSurvived = Math.ceil(result / game.strength);
        troopsLost = this.troopsAssigned - troopsSurvived;
        troopsSurvived += Math.floor(troopsLost * (game.morale / moraleMax));
        troopsLost = this.troopsAssigned - troopsSurvived;
        // calculate enemy troops
        enemiesSurvived = Math.floor(this.troops * (this.morale / moraleMax));
        enemiesDefeated = this.troops - enemiesSurvived;
      }
      else if (result < 0) {
        success = -1;
        // calculate player troops
        troopsSurvived = Math.floor(this.troopsAssigned * (game.morale / moraleMax));
        troopsLost = this.troopsAssigned - troopsSurvived;
        // calculate enemy troops
        enemiesSurvived = -1 * Math.ceil(result / this.strength);
        enemiesDefeated = this.troops - enemiesSurvived;
        enemiesSurvived += Math.floor(troopsLost * (this.morale / moraleMax));
        enemiesDefeated = this.troops - enemiesSurvived;
      }
      else {
        success = 0;
        // calculate player troops
        troopsSurvived = Math.floor(this.troopsAssigned * (game.morale / moraleMax));
        troopsLost = this.troopsAssigned - troopsSurvived;
        // calculate enemy troops
        enemiesSurvived = Math.floor(this.troops * (this.morale / moraleMax));
        enemiesDefeated = this.troops - enemiesSurvived;
      }

      if (this.time > 0) {
        this.time -= 1;
        this.updateDisplay();
      } else {
        let string = "";
        // add a cute tracery thingy here to describe the battle idk (depending on success or failure)
        if (success == 1) {
          string += "You've won the battle over the town. ";
          game.townsConquered += 1;
          if (game.townsConquered == 1) {
            string += "You have persuaded "+this.reward+" troops to join your cause. ";
            game.troops += this.reward;
          }
          if (game.townsConquered % 4 == 0) {
            game.pointsEarned += 1;
          }
          if (game.townsConquered % 3 == 0) {
            game.troops += this.reward;
            string += "You have persuaded "+this.reward+" troops to join your cause. ";
          }
        }
        else if (success == -1) {
          string += "You've lost the battle over the town. ";
        }
        else {
          string += "Both forces in the battle over the town were wiped out. "
        }
        string += troopsSurvived+" of your troops returned from the battle safely, with a total of "+troopsLost+" losses. ";
        string += "You defeated "+enemiesDefeated+" of the enemy troops, but "+enemiesSurvived+" managed to escape with their lives.";
        io.appendIntoElement(string, "reports");
        game.troops += troopsSurvived;
        game.troopsLost += troopsLost;
        game.enemiesSurvived += enemiesSurvived;
        game.enemiesDefeated += enemiesDefeated;
        currTown = new TownClass();
        currTown.updateDisplay();
        game.updateDisplay();
      }
    }
  }

  updateDisplay() {
    io.writeValueIntoClass(this.troops, "townTroops");
    io.writeValueIntoClass(this.morale, "townMorale");
    io.writeValueIntoClass(this.strength, "townStrength");
    io.writeValueIntoClass(this.troopsAssigned, "townAssignedTroops");
    io.writeValueIntoClass(this.time, "townTime");
  }

}

const FortressClass = class {
  constructor() {
    let troopsUpperLimit = 10;
    if (game.fortressesConquered > 0) { troopsUpperLimit = 10 + Math.ceil(game.fortressesConquered * 1.25); }
    let troopsLowerLimit = 6;
    if (game.fortressesConquered > 0) { troopsLowerLimit = 6 + Math.ceil(game.fortressesConquered * 1.25); }
    this.troops = randomInt(troopsLowerLimit, troopsUpperLimit);
    let moraleUpperLimit = 3 + game.fortressesConquered;
    let moraleLowerLimit = 1 + game.fortressesConquered;
    this.morale = randomInt(moraleLowerLimit, moraleUpperLimit);
    let strengthUpperLimit = 4 + Math.ceil(game.fortressesConquered * 1.75);
    let strengthLowerLimit = 2;
    if (game.fortressesConquered > 0) { strengthLowerLimit = 2 + Math.ceil(game.fortressesConquered * 1.5); }
    this.strength = randomInt(strengthLowerLimit, strengthUpperLimit);

    this.troopsAssigned = 0;
    this.battleRunning = false;
    this.reward = Math.ceil(this.troops / 4);

    this.time = 2 * this.troops;

    io.hideElement("fortressTimer");
    io.hideElement("fortressTimerNum");
  }

  addTroops() {
    if (!this.battleRunning) {
      if (this.troopsAssigned < game.troops) {
        this.troopsAssigned += 1;
      }
      else if (this.troopsAssigned == game.troops) {
        this.troopsAssigned = 0;
      }
      this.updateDisplay();
    }
  }

  removeTroops() {
    if (!this.battleRunning) {
      if (this.troopsAssigned > 0) {
        this.troopsAssigned -= 1;
      }
      else if (this.troopsAssigned == 0) {
        this.troopsAssigned = game.troops;
      }
      this.updateDisplay();
    }
  }

  startBattle(){
    if (!this.battleRunning) {
      if (this.troopsAssigned <= game.troops && this.troopsAssigned != 0) {
        this.battleRunning = true;
        game.troops -= this.troopsAssigned;
        game.updateDisplay();
        io.appendIntoElement("You have sent "+this.troopsAssigned+" of your troops out to conquer a fortress", "reports");
      }
      else {
        if (this.troopsAssigned == 0) { io.appendIntoElement("No troops assigned", "reports"); }
        else { io.appendIntoElement("Not enough troops", "reports"); }
      }
    }
  }

  runBattle() {
    if (this.battleRunning) {
      io.showElement("fortressTimer");
      io.showElement("fortressTimerNum");
      let success;
      let troopsSurvived;
      let troopsLost;
      let enemiesSurvived;
      let enemiesDefeated;
      let result = (this.troopsAssigned * game.strength) - (this.troops * this.strength);
      if (result > 0) {
        success = 1;
        // calculate player troops
        troopsSurvived = Math.ceil(result / game.strength);
        troopsLost = this.troopsAssigned - troopsSurvived;
        troopsSurvived += Math.floor(troopsLost * (game.morale / moraleMax));
        troopsLost = this.troopsAssigned - troopsSurvived;
        // calculate enemy troops
        enemiesSurvived = Math.floor(this.troops * (this.morale / moraleMax));
        enemiesDefeated = this.troops - enemiesSurvived;
      }
      else if (result < 0) {
        success = -1;
        // calculate player troops
        troopsSurvived = Math.floor(this.troopsAssigned * (game.morale / moraleMax));
        troopsLost = this.troopsAssigned - troopsSurvived;
        // calculate enemy troops
        enemiesSurvived = -1 * Math.ceil(result / this.strength);
        enemiesDefeated = this.troops - enemiesSurvived;
        enemiesSurvived += Math.floor(troopsLost * (this.morale / moraleMax));
        enemiesDefeated = this.troops - enemiesSurvived;
      }
      else {
        success = 0;
        // calculate player troops
        troopsSurvived = Math.floor(this.troopsAssigned * (game.morale / moraleMax));
        troopsLost = this.troopsAssigned - troopsSurvived;
        // calculate enemy troops
        enemiesSurvived = Math.floor(this.troops * (this.morale / moraleMax));
        enemiesDefeated = this.troops - enemiesSurvived;
      }

      if (this.time > 0) {
        this.time -= 1;
        this.updateDisplay();
      } else {
        let string = "";
        // add a cute tracery thingy here to describe the battle idk (depending on success or failure)
        if (success == 1) {
          string += "You've won the battle over the fortress. ";
          game.fortressesConquered += 1;
          if (game.fortressesConquered == 1) {
            string += "You have persuaded "+this.reward+" troops to join your cause. ";
            game.troops += this.reward;
          }
          if (game.fortressesConquered % 2 == 0) {
            game.troops += this.reward;
            game.pointsEarned += 1;
            string += "You have persuaded "+this.reward+" troops to join your cause. ";
          }
          if (game.fortressesConquered % 3 == 0) {
            game.troopsCost += 10;
          }
        }
        else if (success == -1) {
          string += "You've lost the battle over the fortress. ";
        }
        else {
          string += "Both forces in the battle over the fortress were wiped out. "
        }
        string += troopsSurvived+" of your troops returned from the battle safely, with a total of "+troopsLost+" losses. ";
        string += "You defeated "+enemiesDefeated+" of the enemy troops, but "+enemiesSurvived+" managed to escape with their lives.";
        io.appendIntoElement(string, "reports");
        game.troops += troopsSurvived;
        game.troopsLost += troopsLost;
        game.enemiesSurvived += enemiesSurvived;
        game.enemiesDefeated += enemiesDefeated;
        currFortress = new FortressClass();
        currFortress.updateDisplay();
        game.updateDisplay();
      }
    }
  }

  updateDisplay() {
    io.writeValueIntoClass(this.troops, "fortressTroops");
    io.writeValueIntoClass(this.morale, "fortressMorale");
    io.writeValueIntoClass(this.strength, "fortressStrength");
    io.writeValueIntoClass(this.troopsAssigned, "fortressAssignedTroops");
    io.writeValueIntoClass(this.time, "fortressTime");
  }

}


const CastleClass = class {
  constructor() {
    let troopsUpperLimit = 20;
    if (game.castlesConquered > 0) { troopsUpperLimit = 20 + Math.ceil(game.castlesConquered * 1.5) + game.fortressesConquered; }
    let troopsLowerLimit = 10;
    if (game.castlesConquered > 0) { troopsLowerLimit = 10 + Math.ceil(game.castlesConquered * 1.25) + game.fortressesConquered; }
    this.troops = randomInt(troopsLowerLimit, troopsUpperLimit);
    let moraleUpperLimit = 7 + Math.ceil(game.castlesConquered * 1.5);
    let moraleLowerLimit = 5 + Math.ceil(game.castlesConquered * 1.25);
    this.morale = randomInt(moraleLowerLimit, moraleUpperLimit);
    let strengthUpperLimit = 4 + Math.ceil(game.castlesConquered * 1.5);
    let strengthLowerLimit = 3;
    if (game.castlesConquered > 0) { strengthLowerLimit = 2 + game.castlesConquered; }
    this.strength = randomInt(strengthLowerLimit, strengthUpperLimit);

    this.troopsAssigned = 0;
    this.battleRunning = false;
    this.reward = Math.ceil(this.troops / 3);

    this.time = 3 * this.troops;

    io.hideElement("castleTimer");
    io.hideElement("castleTimerNum");
  }

  addTroops() {
    if (!this.battleRunning) {
      if (this.troopsAssigned < game.troops) {
        this.troopsAssigned += 1;
      }
      else if (this.troopsAssigned == game.troops) {
        this.troopsAssigned = 0;
      }
      this.updateDisplay();
    }
  }

  removeTroops() {
    if (!this.battleRunning) {
      if (this.troopsAssigned > 0) {
        this.troopsAssigned -= 1;
      }
      else if (this.troopsAssigned == 0) {
        this.troopsAssigned = game.troops;
      }
      this.updateDisplay();
    }
  }

  startBattle(){
    if (!this.battleRunning) {
      if (this.troopsAssigned <= game.troops && this.troopsAssigned != 0) {
        this.battleRunning = true;
        game.troops -= this.troopsAssigned;
        game.updateDisplay();
        io.appendIntoElement("You have sent "+this.troopsAssigned+" of your troops out to conquer a castle", "reports");
      }
      else {
        if (this.troopsAssigned == 0) { io.appendIntoElement("No troops assigned", "reports"); }
        else { io.appendIntoElement("Not enough troops", "reports"); }
      }
    }
  }

  runBattle() {
    if (this.battleRunning) {
      io.showElement("castleTimer");
      io.showElement("castleTimerNum");
      let success;
      let troopsSurvived;
      let troopsLost;
      let enemiesSurvived;
      let enemiesDefeated;
      let result = (this.troopsAssigned * game.strength) - (this.troops * this.strength);
      if (result > 0) {
        success = 1;
        // calculate player troops
        troopsSurvived = Math.ceil(result / game.strength);
        troopsLost = this.troopsAssigned - troopsSurvived;
        troopsSurvived += Math.floor(troopsLost * (game.morale / moraleMax));
        troopsLost = this.troopsAssigned - troopsSurvived;
        // calculate enemy troops
        enemiesSurvived = Math.floor(this.troops * (this.morale / moraleMax));
        enemiesDefeated = this.troops - enemiesSurvived;
      }
      else if (result < 0) {
        success = -1;
        // calculate player troops
        troopsSurvived = Math.floor(this.troopsAssigned * (game.morale / moraleMax));
        troopsLost = this.troopsAssigned - troopsSurvived;
        // calculate enemy troops
        enemiesSurvived = -1 * Math.ceil(result / this.strength);
        enemiesDefeated = this.troops - enemiesSurvived;
        enemiesSurvived += Math.floor(troopsLost * (this.morale / moraleMax));
        enemiesDefeated = this.troops - enemiesSurvived;
      }
      else {
        success = 0;
        // calculate player troops
        troopsSurvived = Math.floor(this.troopsAssigned * (game.morale / moraleMax));
        troopsLost = this.troopsAssigned - troopsSurvived;
        // calculate enemy troops
        enemiesSurvived = Math.floor(this.troops * (this.morale / moraleMax));
        enemiesDefeated = this.troops - enemiesSurvived;
      }

      if (this.time > 0) {
        this.time -= 1;
        this.updateDisplay();
      } else {
        let string = "";
        // add a cute tracery thingy here to describe the battle idk (depending on success or failure)
        if (success == 1) {
          string += "You've won the battle over the castle. ";
          game.castlesConquered += 1;
          if (game.castlesConquered == 1) {
            game.fundsIncrement += 2;
            string += "You have increased the rate of your funds accumulation. ";
          }
          if (game.castlesConquered % 2 == 0) {
            game.pointsEarned += 1;
            string += "You have increased the rate of your funds accumulation. ";
          }
          if (game.castlesConquered % 3 == 0) {
            game.fundsIncrement += 2;
            game.foodCost += 10;
            game.troopsCost += 15;
          }
        }
        else if (success == -1) {
          string += "You've lost the battle over the castle. ";
        }
        else {
          string += "Both forces in the battle over the castle were wiped out. "
        }
        string += troopsSurvived+" of your troops returned from the battle safely, with a total of "+troopsLost+" losses. ";
        string += "You defeated "+enemiesDefeated+" of the enemy troops, but "+enemiesSurvived+" managed to escape with their lives.";
        io.appendIntoElement(string, "reports");
        game.troops += troopsSurvived;
        game.troopsLost += troopsLost;
        game.enemiesSurvived += enemiesSurvived;
        game.enemiesDefeated += enemiesDefeated;
        currCastle = new CastleClass();
        currCastle.updateDisplay();
        game.updateDisplay();
      }
    }
  }

  updateDisplay() {
    io.writeValueIntoClass(this.troops, "castleTroops");
    io.writeValueIntoClass(this.morale, "castleMorale");
    io.writeValueIntoClass(this.strength, "castleStrength");
    io.writeValueIntoClass(this.troopsAssigned, "castleAssignedTroops");
    io.writeValueIntoClass(this.time, "castleTime");
  }

}

// this function forom JQuery waits until the web page is fully loaded before triggering the start of the game
$( document ).ready(function() {
  game = new GameInstance();
  game.narrativeManager.setup();
  currFarmland = new FarmlandsClass();
  currTown = new TownClass();
  currFortress = new FortressClass();
  currCastle = new CastleClass();
  
  io.showStage(game); 
  game.updateDisplay();
  currFarmland.updateDisplay();
  currTown.updateDisplay();
  currFortress.updateDisplay();
  currCastle.updateDisplay();

  startRecording(game);

  // Run the Loop
  gameTimer = setInterval(function(){
    game.increaseFunds()
    game.narrativeManager.assess()
    game.updateDisplay()
    currFarmland.updateDisplay()
    currFarmland.runBattle()
    currTown.updateDisplay()
    currTown.runBattle()
    currFortress.updateDisplay()
    currFortress.runBattle()
    currCastle.updateDisplay()
    currCastle.runBattle()
  }, 500)

  gameTimer = setInterval(function() {
    game.feedTroops()
  }, 20000)

  gameTimer = setInterval(function(){
    game.increaseFood()
  }, 10000)
  
})
