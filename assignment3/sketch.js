// GLOBAL VARIABLES
let enemy_prompt_button;
let event_prompt_button;

// JSON TRACERY GRAMMARS
const enemyPromptJSON = {
    "origin": ["#[monster:#name#]prompt#"],
    "name": ["Dragon", "Wyvern", "Wyrm", "Basilisk", "Hydra", "Wraith", "Ghost", "Demon", "Imp", "Goblin", "Ghoul", "Golem", "Spider", "Scorpion", "Zombie", "Undead", "Skeleton", "Slime", "Ooze", "Chimera", "Beast", "Wolf", "Abomination"],
    "prompt": ["#monster#\n\n#description#\n#behavior#\n\n#stats#"],
    "description": ["#location# you see a #size# #monster#, with #feature_adj# #feature#. When it spots you, it lets out a #noise_adj# #noise#. The #monster# begins #movement#, its movements #movement_adj#."],
    "location": ["Around the corner,", "Backed against the side of a wall,", "As you walk around the corner,", "At the end of the path,", "Suddenly,", "Unexpectedly, ", "Right in front of you, "],
    "size": ["hulking", "large", "massive", "small", "colossal", "tiny"],
    "feature_adj": ["fearsome", "sharp", "piercing", "ferocious", "strange", "terrifyingly large", "razor-sharp", "keen", "harsh", "hundreds of"],
    "feature": ["teeth", "claws", "fangs", "horns", "eyes", "tails", "scales", "spikes", "legs", "arms", "limbs", "wings"],
    "noise_adj": ["bellowing", "loud", "terrifying", "stabbing", "intense", "horrifying", "deafening", "booming", "thunderous", "ear-splitting", "sorrowful", "quiet"],
    "noise": ["roar", "scream", "shreik", "snarl", "whimper", "growl", "yell", "holler", "yowl", "howl", "hiss"],
    "movement": ["running towards you", "slithering", "stomping", "leaping", "crawling", "shifting", "staggering", "pacing", "swiping at you", "twisting its body", "scampering", "skittering", "prowling", "limping around", "sprinting towards you", "attacking you"],
    "movement_adj": ["erraic", "deranged", "quick", "fast", "languid", "feeble", "unpredictable", "slow", "steady", "unsteady", "determined", "resolute", "firm", "persistent", "tenacious", "aimless", "unfocused"],
    "behavior": ["This #monster# is #aggressiveness# those navigating the labyrinth, and will #exclusiveness# target foes with #degree# #player_stat#. It focuses on #priority# during combat, but will #behavior_change# when its health is #health_level#."],
    "aggressiveness": ["highly agressive towards", "moderately aggressive towards", "mostly passive towards", "highly skiddish towards", "extremely wary of"],
    "exclusiveness": ["primarily", "exclusively", "never", "rarely"],
    "degree": ["very low", "very high", "moderate"],
    "player_stat": ["health", "movement speed", "attack range", "attack", "defense"],
    "priority": ["defending its territory", "standing its ground", "chasing after intruders", "attacking nearby foes", "evading enemy attacks", "hiding in corners", "chasing foes into corners", "seperating its enemies", "leading the adventurers deeper into the labyrinth", "hiding behind walls"],
    "behavior_change": ["become enraged and increase its attack", "begin trying to run away", "become more defensive", "heal its wounds", "attack more frequently", "start using different attacks", "move at a much quicker speed", "begin attacking randomly", "start attacking walls", "lessen its defenses", "become weaker and decrease its attack"],
    "health_level": ["full", "almost full", "halved", "nearly depleated"],
    "stats": ["Health Points: #HP#\nMovement Modifier: #MM#\nAttack Modifier: #AM#\nAttack Range: #AR#\nDefense: #D#\n"],
    "HP": ["3", "4", "5", "6", "7", "8", "8", "9", "9", "9", "10", "10", "10", "11", "11", "11", "12", "12", "13", "14", "15", "16", "17", "18"],
    "MM": ["-1", "-1", "0", "0", "0", "1", "1", "2", "3"],
    "AM": ["-1", "0", "0", "1", "1", "1", "2", "2", "3"],
    "AR": ["1", "1", "1", "2", "2", "3"],
    "D": ["0", "0", "1", "1", "1", "2", "2", "3"]
};

const eventPromptJSON = {
    "origin": ["#[object:#name#]prompt#"],
    "name": ["instrument", "sword", "ring", "necklace", "mirror", "spear", "keychain", "music box", "pen", "earing", "bracelet", "knife", "flower", "coat", "notebook", "locket", "hairpin", "gemstone", "coin", "daggar", "statuette", "toy", "book", "bag", "hat"],
    "prompt": ["#title#\n\n#description#\n#memory#\n#questions#\n\n#result#"],
    "title": ["A #piece# of #mem#", "A#encounter# with #mem#"],
    "piece": ["Fragment", "Sliver", "Shard", "Remnant", "Story", "Portion", "Scrap", "Shred", "Tale", "Recountering", "Remembrance"],
    "mem": ["Memory", "the Past", "Another World", "Your Past Self", "Time Long Past", "Another Universe", "a Past Once Known"],
    "encounter": ["n Encounter", " Run In", " Meeting", " Confrontation", "n Engagement", " Chance Encounter", " Meeting"],
    "description": ["#location# you spot a #adj# object. As you get closer you notice that it is a #object#."],
    "location": ["Lying on the ground in front of you,", "Tucked into a corner,", "Lying against a nearby wall,", "Embeded in a crack in the wall,", "Sitting on the floor,", "Propped up against a wall,", "Stuck inside a hole in the floor,"],
    "adj": ["small", "large", "shining", "glittering",  "sparkling", "strange", "familiar", "foreign", "glowing", "bloodstained", "silver", "golden", "unknown", "shadowy"],
    "memory": ["Seeing this #object# you are filled with a sense of #emotion# and #emotion#. You are reminded of #memory_location#"],
    "emotion": ["happiness", "joy", "anger", "rage", "sadness", "despair", "sorrow", "melancholy", "loss", "lonliness", "betrayal", "friendship", "companionship", "love", "agony", "pain", "disgust", "gratitude", "jealousy", "anxiety", "confusion", "shame", "guilt", "fear", "terror", "admiration", "agitation", "adoration", "hopelessness", "misery", "panic", "biterness", "frustration", "vengeful", "horror", "delight", "calm", "contentment", "regret", "hatred", "dejection", "dismay", "envy", "fondness", "hope", "isolation", "nostalgia", "powerlessness", "pride", "rejection"],
    "memory_location": ["a place you once knew, somewhere #place_location#. A #place# that you can #degree#."],
    "place_location": ["close to your heart", "far away", "you once visited often", "that was once important to you", "that you grew up in", "nearby", "long gone", "you spent a lot of time within", "you never wanted to return to", "hoped to return to", "always wanted to leave", "never wanted to leave"],
    "place": ["#place_adj# town", "#place_adj# mountain range", "#place_adj# field", "#place_adj# road", "#place_adj# courtyard", "#place_adj# house", "#place_adj# castle", "#place_adj# riverside", "#place_adj# city", "#place_adj# battlefield", "#place_adj# desert", "#place_adj# ocean", "#place_adj# resturant", "#place_adj# valley", "#place_adj# shrine", "#place_adj# temple", "#place_adj# ruin"],
    "place_adj": ["vast", "empty", "deserted", "lively", "beautiful", "desecrated", "war-torn", "scorched", "abandonded", "flowery", "snowy", "wide-open", "broken-down", "destroyed", "warm", "wonderful", "bloodied", "terrifying", "haunted", "lovely", "ransacked", "bustling", "calming", "picturesque", "vibrant", "bleak", "desolate", "stormy", "bright", "ancient", "magical", "mystical", "quiet", "silent"],
    "degree": ["just scarcely remember", "hardly remember", "almost remember", "nearly remember", "barely hold on to the memory of", "feel the memory of slipping away"],
    "questions": ["Where was this place and what does the #object# have to do with it? ", "What happened at this place to make you feel this way? What does the #object# have to do with this?", "What are your memories of this place? Why did the #object# remind you of it?", "What happened here? What happened with the #object#?", "Why does this place and the #object# make you feel this way?", "Why is this place and the #object# in your memories?", "What is it about the #object# that reminds you of this place?", "Why does the #object# bring back memories of this place?"],
    "result": ["Dice Result: #dice#"],
    "dice": ["1", "2", "3", "3", "4", "4", "5", "6"]
};

// SETUP FUNCTION
function setup() {
    createCanvas(900, (windowHeight - 20));
    background(55, 60, 65);
    enemy_prompt_button = new Button('Generate Monster', 0);
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
        background(55, 60, 65);
        enemy_prompt_button.display();
        event_prompt_button.display();
        let txt = generateGrammar(enemyPromptJSON);
        textAlign(CENTER, CENTER);
        rectMode(RADIUS);
        textSize(20);
        fill(255);
        text(txt, 0, 0, (width - 40), (height - 100));
    }
    else if (event_prompt_button.mouseOnButton()) {
        background(55, 60, 65);
        enemy_prompt_button.display();
        event_prompt_button.display();
        let txt = generateGrammar(eventPromptJSON);
        textAlign(CENTER, CENTER);
        rectMode(RADIUS);
        textSize(20);
        fill(255);
        text(txt, 0, 0, (width - 40), (height - 100));
    }
}

function generateGrammar(file) {
    let textGrammar = tracery.createGrammar(file);
    let txt = textGrammar.flatten("#origin#");
    return txt;
  }

class Button {
    constructor(text, num) {
        let offset = 40;
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