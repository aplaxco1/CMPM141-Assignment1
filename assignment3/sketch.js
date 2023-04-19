// GLOBAL VARIABLES
let enemy_prompt_button;
let character_prompt_button;
let event_prompt_button;

// SETUP FUNCTION
function setup() {
    createCanvas(800, 700);
    emeny_prompt_button = new Button();
    character_prompt_button = new Button();
    event_prompt_button = new Button();
}

// DRAW FUNCTION
function draw() {
    background(0);
}

// CLASSES/FUNCTIONS
function mousePressed() {
}

class Button {
    constructor() {
        this.x;
        this.y;
        this.text;
    }

    update() {
    }

    display() {
    }
}