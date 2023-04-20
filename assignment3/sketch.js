// GLOBAL VARIABLES
let enemy_prompt_button;
let event_prompt_button;

// JSON TRACERY GRAMMARS
const enemyPromptJSON = {
    // placeholder stuff
    "origin": ["#enemy#"],
    "enemy": ["dragon", "slime", "undead", "ghost", "basilisk", "goblin", "beast"]
};

const eventPromptJSON = {
    // placeholder stuff
    "origin": ["#event#"],
    "event": ["you trigger a trap", "you are teleported back to the entrance of the labyrinth", "you encounter on object from your past",
    "you lose conciousness", "you see a ghost"]
};

// SETUP FUNCTION
function setup() {
    createCanvas(900, (windowHeight - 20));
    //background(55, 60, 65);
    background(0);
    enemy_prompt_button = new Button('Generate Enemy', 0);
    event_prompt_button = new Button('Generate Character Event', 1);
}

// DRAW FUNCTION
function draw() {
    enemy_prompt_button.display();
    enemy_prompt_button.update();
    event_prompt_button.display();
    event_prompt_button.update();
}

// CLASSES/FUNCTIONS
function mousePressed() {
    if (enemy_prompt_button.mouseOnButton()) {
        background(0);
        enemy_prompt_button.display();
        event_prompt_button.display();
        let display = generateGrammar(enemyPromptJSON);
        textAlign(CENTER, CENTER);
        rectMode(RADIUS);
        textSize(25);
        fill(255);
        text(display, 0, 0, (width - 40), (height - 100));
    }
    else if (event_prompt_button.mouseOnButton()) {
        background(0);
        enemy_prompt_button.display();
        event_prompt_button.display();
        let display = generateGrammar(eventPromptJSON);
        textAlign(CENTER, CENTER);
        rectMode(RADIUS);
        textSize(25);
        fill(255);
        text(display, 0, 0, (width - 40), (height - 100));
    }
}

function generateGrammar(file) {
    let textGrammar = tracery.createGrammar(file);
    let text = textGrammar.flatten("#origin#");
    return text;
  }

class Button {
    constructor(text, num) {
        let offset = 30;
        this.width = (width - (3 * offset)) / 2;
        this.height = 60;
        this.x = offset + (this.width * num) + (offset * num)
        this.y = height - offset - this.height;
        this.text = text;
        this.lightColor = [70, 175, 255];
        this.darkColor = [55, 140, 205];
        this.currColor = this.lightColor;
    }

    mouseOnButton() {
        if ((mouseX > this.x) && (mouseX < this.x + this.width) && (mouseY > this.y) && (mouseY < this.y + this.height)) {
            return true;
        }
        else {
            return false;
        }
    }

    update() {
        if (this.mouseOnButton()) {
            this.currColor = this.darkColor;
        }
        else {
            this.currColor = this.lightColor;
        }
    }

    display() {
        noStroke();
        fill(this.currColor[0], this.currColor[1], this.currColor[2]);
        rectMode(CORNER);
        rect(this.x, this.y, this.width, this.height);
        textAlign(CENTER, CENTER);
        textSize(15);
        fill(255);
        text(this.text, this.x + (this.width / 2), this.y + (this.height / 2));
    }
}