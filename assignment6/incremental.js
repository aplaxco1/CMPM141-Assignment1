const farmland_conquest = {
  "origin": "#story#",
  "story": "Your troops travel #direction#, #where# the #adj1# #location#. Once they reach the #adj2# #place#, they begin their #battle#. ",
  "direction": ["north", "south", "east", "west", "eastward", "westward"],
  "where": ["across", "through", "underneath", "near", "above", "apst"],
  "adj1": ["arid", "dry", "deserted","grassy", "vast", "empty", "war-torn", "bleak", "quiet", "silent", "stormy", "ancient"],
  "location": ["plains", "desert", "feilds", "forests", "hills", "woods", "mountains"],
  "adj2": ["impoverished", "desecrated", "destroyed", "run-down", "broken-down", "sinking", "declining", "flourishing", "thriving", "enriched", "lively", "war-torn", "ransacked", "bustling", "scortched", "desolate"],
  "place": ["farm village", "farming village", "farmlands"],
  "battle": ["fight", "struggle", "conquest", "battle", "slaughter", "armed conflict", "clash", "melee", "campaign", "skirmish", "engagement"],
}

const town_conquest = {
  "origin": "#story#",
  "story": "Your troops travel #direction#, #where# the #adj1# #location#. Once they reach the #adj2# #place#, they begin their #battle#. ",
  "direction": ["north", "south", "east", "west", "eastward", "westward"],
  "where": ["across", "through", "underneath", "near", "above", "past"],
  "adj1": ["arid", "dry", "deserted", "grassy", "vast", "empty", "war-torn", "bleak", "quiet", "silent", "stormy", "ancient", "snowy", "rainy"],
  "location": ["plains", "desert", "feilds", "forests", "hills", "woods", "mountains", "villages", "river", "ocean"],
  "adj2": ["impoverished", "desecrated", "destroyed", "run-down", "declining", "flourishing", "thriving", "enriched", "lively", "war-torn", "ransacked", "bustling", "picturesque", "desolate", "bustling", "near-empty", "forgotten"],
  "place": ["city", "town"],
  "battle": ["fight", "struggle", "conquest", "battle", "slaughter", "armed conflict", "clash", "melee", "campaign", "skirmish", "engagement"],
}

const fortress_conquest = {
  "origin": "#story#",
  "story": "Your troops travel #direction#, #where# the #adj1# #location#. Once they reach the #adj2# #place#, they begin their #battle#. ",
  "direction": ["north", "south", "east", "west", "eastward", "westward"],
  "where": ["across", "through", "underneath", "near", "above", "past"],
  "adj1": ["arid", "dry", "deserted","grassy", "vast", "empty", "war-torn", "empty", "bleak", "quiet", "silent", "stormy", "ancient", "war-torn", "snowy", "rainy", "depressing", "territorial"],
  "location": ["plains", "desert", "feilds", "forests", "hillsides", "woods", "mountains", "villages", "penninsula"],
  "adj2": ["desecrated", "run-down", "sinking", "war-torn", "desolate", "powerful", "full", "intimidating", "tall", "vast", "large", "impenetrable", "stone"],
  "place": ["military fort", "fortress", "citadel", "bastion", "stronghold"],
  "battle": ["fight", "struggle", "conquest", "battle", "slaughter", "armed conflict", "clash", "melee", "campaign", "skirmish", "engagement"],
}

const castle_conquest = {
  "origin": "#story#",
  "story": "Your troops travel #direction#, #where# the #adj1# #location#. Once they reach the #adj2# #place#, they begin their #battle#. ",
  "direction": ["north", "south", "east", "west", "eastward", "westward"],
  "where": ["across", "through", "underneath", "near", "above", "past"],
  "adj1": ["decaying", "arid", "dry", "deserted","grassy", "vast", "empty", "war-torn", "bleak", "quiet", "silent", "stormy", "ancient", "eerie", "snowy", "rainy", "desolate", "empty", "destroyed"],
  "location": ["plains", "desert", "feilds", "forests", "hills", "woods", "mountains", "ocean", "lands", "villages", "towns", "cities", "territories"],
  "adj2": ["decaying", "impoverished", "desecrated", "destroyed", "broken-down", "sinking", "declining", "flourishing", "war-torn", "ransacked", "picturesque", "scortched", "impenetrable", "large", "intimidating", "small", "impregnable", "tyrannical", "opressive", "massive", "luxurious", "stone"],
  "place": ["castle", "palace"],
  "battle": ["fight", "struggle", "conquest", "battle", "slaughter", "armed conflict", "clash", "melee", "campaign", "skirmish", "engagement"],
}

const spooky_event = {
  "origin": "#story#",
  "story": "Throughout the #battle# your troops are tormented by the #event#. ",
  "battle": ["fight", "struggle", "conquest", "battle", "slaughter", "armed conflict", "clash", "melee", "campaign", "skirmish", "engagement"],
  "event": ["bloodied corpses of past fallen troops", "ghostly corpses hanging from the trees", "hollowing faces of those long perished", "howling moans of the deceased", "tembling hands of those they killed", "piles of bloodied corpses", "painful cries of those left standing", "agonized moans of the dead", "howling of perished spirits", "bloodied, armored ghosts of their perished enemies"]
}

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
    this.enemiesSurvived = 0;
    
    // battle management stuff
    this.pointsEarned = 0;
    this.morale = 0;
    this.strength = 1;
    this.castlesConquered = 0;
    this.fortressesConquered = 0;
    this.townsConquered = 0;
    this.farmlandsConquered = 0;

    // story events
    this.ratsEvent = 1;
    this.plaugeEvent = 1;
    this.banditsEvent = 1;
    this.territoryStolen = 1;
    this.troopsGhosts = 1;
    this.enemyGhosts = 1;
  }

  updateEvents() {
    // set values
    this.ratsEvent = 1 - (this.foodIncrement * 0.02); 
    if (this.ratsEvent < 0.85) { this.ratsEvent = 0.85; }
    this.plaugeEvent = 1 - ((this.foodIncrement * 0.005) + (this.troopsLost * 0.005));
    if (this.plaugeEvent < 0.85) { this.plaugeEvent = 0.85; }
    this.banditsEvent =  1 - (this.enemiesSurvived * 0.001);
    if (this.banditsEvent < 0.85 ) {this.banditsEvent = 0.85; }
    this.territoryStolen = 1 -  (this.enemiesSurvived * 0.002);
    if (this.territoryStolen < 0.85 ) {this.territoryStolen = 0.85; }
    this.troopsGhosts = 1 - (this.troopsLost * 0.001);
    if (this.troopsGhosts < 0.45){ this.troopsGhosts = 0.45; }
    this.enemyGhosts = 1 - (this.enemiesSurvived * 0.002);
    if (this.enemyGhosts < 0.85 ) {this.enemyGhosts = 0.85;}

    // console.log("rats="+this.ratsEvent);
    // console.log("plauge="+this.plaugeEvent);
    // console.log("bandits="+this.banditsEvent);
    // console.log("territory="+this.territoryStolen);
    // console.log("troopGhost="+this.troopsGhosts);
    // console.log("enemyGhosts="+this.enemyGhosts);
  }

  ratEventTrigger() {
    if (Math.random() > this.ratsEvent && this.foodSupply != 0) {
      this.foodSupply -= Math.floor(this.foodSupply * 0.40);
      if (this.foodSupply < 0) {this.foodSupply = 0; }
      let events = ["Rats invade your storage and eat a large portion of your food supply.\n\n", "A group of starving children sneak into your storage and eat a portion of your food supply.\n\n", "Insects invaid your storage and destroy a portion of your food supply.\n\n"];
      let num = randomInt(0, 2);
      io.appendIntoElement(events[num], "reports");
      this.updateDisplay();
    }
  }

  plaugeEventTrigger(){
    if (Math.random() > this.plaugeEvent && this.troops != 0) {
      let died = Math.floor(this.troops * 0.60);
      if (died > this.troops) {died = this.troops; } 
      this.troops -= died;
      this.troopsLost += died;
      let events = ["Troops within your army start to catch the plauge. "+died+" of your troops die before it can be contained.\n\n", "A sickness infects some of your troops, resulting in "+died+"deaths.\n\n"];
      let num = randomInt(0, 1);
      io.appendIntoElement(events[num], "reports");
      this.updateDisplay();
    }
  }

  banditsEventTrigger() {
    if (Math.random() > this.banditsEvent && this.funds != 0) {
      let fundsLost = Math.floor(this.funds * 0.40);
      if (fundsLost > this.funds) {fundsLost = this.funds; }
      this.funds -= fundsLost;
      let events = ["Bandits sneak into your camp and steal a portion of your funds.\n\n", "Beggars from a nearby town become desperate and sneak into your camp to steal a portion of your funds.\n\n"];
      let num = randomInt(0, 1);
      io.appendIntoElement(events[num], "reports");
      this.updateDisplay(); 
    }
  }

  territoryStolenEvent() {
    if (Math.random() > this.territoryStolen && (this.farmlandsConquered + this.townsConquered + this.fortressesConquered + this.castlesConquered) != 0) {
      while (true) {
        let type = randomInt(1, 4);
        if (type == 1 && this.farmlandsConquered != 0) {
          this.farmlandsConquered -= 1;
          if (game.strength != 0) { game.strength -= 1; }
          io.appendIntoElement("Enemies that survived reclaimed a conquered farmland. Your troops have lost a bit of strengh.\n\n", "reports");
          this.updateDisplay()
          break;
        }
        if (type == 2 && this.townsConquered != 0) {
          this.townsConquered -= 1;
          if (game.strength != 0) { game.strength -= 1; }
          io.appendIntoElement("Enemies that survived reclaimed a conquered town. Your troops have lost a bit of strengh.\n\n", "reports");
          this.updateDisplay()
          break;
        }
        if (type == 3 && this.fortressesConquered != 0) {
          this.fortressesConquered -= 1;
          if (game.strength > 1) { game.strength -= 1; }
          io.appendIntoElement("Enemies that survived reclaimed a conquered fortress. Your troops have lost a bit of strengh.\n\n", "reports");
          this.updateDisplay()
          break;
        }
        if (type == 4 && this.castlesConquered != 0) {
          this.castlesConquered -= 1;
          if (game.strength != 0) { game.strength -= 1; }
          io.appendIntoElement("Enemies that survived reclaimed a conquered castle. Your troops have lost a bit of strengh.\n\n", "reports");
          this.updateDisplay()
          break;
        }
      }
    }
  }

  enemyGhostEvent() {
    if (Math.random() > this.enemyGhosts) {
      this.troops -= Math.ceil(this.troops * 0.25);
      if (this.troops < 0) {this.troops = 0;}
      if (this.morale > 0) {this.morale -= 1;}
      this.troopsCost += 2;
      io.appendIntoElement("Your camp is haunted by the ghosts of the fallen whom you defeated. A portion of your troops run away in fear, while the rest are left with lowered morale.\n\n", "reports");
      this.updateDisplay();
    }
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
      io.appendIntoElement("You do not have enough funds to purchase more food.\n\n", "reports");
    }
    this.updateDisplay();
  }

  purchaseTroops() {
    if ((this.funds - this.troopsCost) >= 0) {
      if (!(Math.random() > this.troopsGhosts)) {
        this.troops += 1; 
      }
      else {
        let events = ["Your reputation has spread throughout the land, and troops are hesitant to join your army.\n\n", "The souls of your fallen troops have warned off a potential solider.\n\n", "A potential solider is scared off by the tales of your fallen troops.\n\n"]
        let num = randomInt(0, 2)
        io.appendIntoElement(events[num], "reports");
      }
      this.funds -= this.troopsCost;
    }
    else {
      io.appendIntoElement("You do not have enough funds to recruit new troops.\n\n", "reports");
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
      io.appendIntoElement(died+" of your troops starved to death.\n\n", "reports");
    }
    this.updateDisplay();
  }

  increaseStrength() {
    if (this.pointsEarned >= 1) {
      this.strength += 1;
      this.pointsEarned -= 1;
      io.appendIntoElement("Your troops have become stronger.\n\n", "reports");
      this.updateDisplay();
    }
    else {
      io.appendIntoElement("You do not have enough points to increase your troops' strength.\n\n", "reports");
    }
  }

  increaseMorale() {
    if (this.pointsEarned >= 1) {
      this.morale += 1;
      this.pointsEarned -= 1;
      io.appendIntoElement("You have increased morale amoung your troops.\n\n", "reports");
      this.updateDisplay();
    }
    else {
      io.appendIntoElement("You do not have enough points to increase your troops' morale.\n\n", "reports");
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
        let string = "You have sent "+this.troopsAssigned+" of your troops out to conquer a farmland. "
        string += grammars.GenerationSimple(farmland_conquest);
        if (game.enemiesDefeated > 50 && game.farmlandsConquered > 6) { string += (grammars.GenerationSimple(spooky_event) + "\n\n"); }
        else { string += "\n\n"; }
        io.appendIntoElement(string, "reports");
      }
      else {
        if (this.troopsAssigned == 0) { io.appendIntoElement("You have not assigned any troops to this farmland.\n\n", "reports"); }
        else { io.appendIntoElement("You do not have the assigned number of troops available.\n\n", "reports"); }
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
          string += "With these new farmlands, your food production has increased. ";
          game.foodIncrement += randomInt(1, 2);
          if (game.farmlandsConquered % 3 == 0) {
            game.pointsEarned += 1;
          }
          if (game.farmlandsConquered % 4 == 0) {
            game.foodNeed += 1;
            game.foodCost += 5;
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
        string += "\n\n";
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
        let string = "You have sent "+this.troopsAssigned+" of your troops out to conquer a town. "
        string += grammars.GenerationSimple(town_conquest);
        if (game.enemiesDefeated > 50 && game.townsConquered > 4) { string += (grammars.GenerationSimple(spooky_event) + "\n\n"); }
        else { string += "\n\n"; }
        io.appendIntoElement(string, "reports");
      }
      else {
        if (this.troopsAssigned == 0) { io.appendIntoElement("You have not assigned any troops to this town.\n\n", "reports"); }
        else { io.appendIntoElement("You do not have the assigned number of troops available.\n\n", "reports"); }
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
          if (game.townsConquered % 2 == 0) {
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
        string += "\n\n";
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
    this.moneyReward = this.troops * 4;

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
        let string = "You have sent "+this.troopsAssigned+" of your troops out to conquer a fortress. "
        string += grammars.GenerationSimple(fortress_conquest);
        if (game.enemiesDefeated > 50 && game.fortressesConquered > 2) { string += (grammars.GenerationSimple(spooky_event) + "\n\n"); }
        else { string += "\n\n"; }
        io.appendIntoElement(string, "reports");
      }
      else {
        if (this.troopsAssigned == 0) { io.appendIntoElement("You have no assigned any troops to this fortress.\n\n", "reports"); }
        else { io.appendIntoElement("You do not have the assigned number of troops available.\n\n", "reports"); }
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
          game.pointsEarned += 1;
          game.funds += this.moneyReward;
          if (game.fortressesConquered == 1) {
            string += "You have persuaded "+this.reward+" troops to join your cause. ";
            game.troops += this.reward;
          }
          if (game.fortressesConquered % 2 == 0) {
            game.troops += this.reward;
            string += "You have persuaded "+this.reward+" troops to join your cause. ";
          }
          if (game.fortressesConquered % 3 == 0) {
            game.troopsCost += 5;
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
        string += "\n\n";
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
        let string = "You have sent "+this.troopsAssigned+" of your troops out to conquer a castle. "
        string += grammars.GenerationSimple(castle_conquest);
        if (game.enemiesDefeated > 50 && game.castlesConquered > 2) { string += (grammars.GenerationSimple(spooky_event) + "\n\n"); }
        else { string += "\n\n"; }
        io.appendIntoElement(string, "reports");
      }
      else {
        if (this.troopsAssigned == 0) { io.appendIntoElement("You have not assigned any troops to this castle.\n\n", "reports"); }
        else { io.appendIntoElement("You do not have the assigned number of troops available.\n\n", "reports"); }
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
          game.pointsEarned += 2;
          if (game.castlesConquered == 1) {
            game.fundsIncrement += 2;
            string += "You have increased the rate of your funds accumulation. ";
          }
          if (game.castlesConquered % 2 == 0) {
            game.fundsIncrement += 2;
            string += "You have increased the rate of your funds accumulation. ";
          }
          if (game.castlesConquered % 3 == 0) {
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
        string += "\n\n";
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

function checkStats() {
  //console.log(strengthMax, moraleMax);
  if (game.strength > strengthMax || currFarmland.strength > strengthMax || currTown.strength > strengthMax || currFortress.strength > strengthMax || currCastle.strength > strengthMax) {
    strengthMax = math.ceil(strengthMax * 1.5); 
  }
  if (game.morale > moraleMax || currFarmland.morale > moraleMax || currTown.morale > moraleMax || currFortress.morale > moraleMax || currCastle.morale > moraleMax) {
    moraleMax = math.ceil(moraleMax * 1.5); 
  }
}

// this function forom JQuery waits until the web page is fully loaded before triggering the start of the game
$( document ).ready(function() {
  strengthMax = 30;
  moraleMax = 25;

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
    checkStats()
    game.increaseFunds()
    game.narrativeManager.assess()
    game.updateEvents()
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
    game.banditsEventTrigger()
  }, 7000)

  gameTimer = setInterval(function() {
    game.territoryStolenEvent()
  }, 32000)

  gameTimer = setInterval(function() {
    game.enemyGhostEvent()
  }, 30000)

  gameTimer = setInterval(function() {
    game.feedTroops()
    game.plaugeEventTrigger()
  }, 18000)

  gameTimer = setInterval(function(){
    game.increaseFood()
    game.ratEventTrigger()
  }, 9000)
  
})
