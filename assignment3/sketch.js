// GLOBAL VARIABLES
let enemy_prompt_button;
let event_prompt_button;

// SETUP FUNCTION
function setup() {
    createCanvas(900, 700);
    enemy_prompt_button = new Button('Generate Enemy', 0);
    event_prompt_button = new Button('Generate Character Event', 1);
}

// DRAW FUNCTION
function draw() {
    background(55, 60, 65);

    enemy_prompt_button.display();
    enemy_prompt_button.update();
    event_prompt_button.display();
    event_prompt_button.update();

}

// CLASSES/FUNCTIONS
function mousePressed() {
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
        rect(this.x, this.y, this.width, this.height);
        textAlign(CENTER, CENTER);
        textSize(15);
        fill(255);
        text(this.text, this.x + (this.width / 2), this.y + (this.height / 2));
    }
}