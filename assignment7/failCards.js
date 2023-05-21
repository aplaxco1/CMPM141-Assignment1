failCards = [
  {resource:"happiness", 
  level: "high", 
  card: {
    prompt: "You have made all of the cats at your adoption center incredibly happy! Now they'll never leave your side. Not much of an adoption center anymore.",
    rightChoiceText: "So long adoption center!",
    rightChoice: function(){
      location.reload();
    },
    leftChoiceText: "The cats are all for me!", 
    leftChoice: function(){
      location.reload();
    },
    name: "Narrator",
    resultText: "",
    image: "./images/NarratorCat.jpg"
  }},
  {resource:"happiness", 
  level: "low", 
  card: {
    prompt: "All of the cats at yor adoption center have become incredibly sad! They've all ran away from your adoption center to find loving families on their own!",
    rightChoiceText: "I'm so sorry cats!",
    rightChoice: function(){
      location.reload();
    },
    leftChoiceText: "Oh no! What have I done!?", 
    leftChoice: function(){
      location.reload();
    },
    name: "Narrator",
    resultText: "",
    image: "./images/NarratorCat.jpg"
  }},
  {resource:"cuteness", 
  level: "high", 
  card: {
    prompt: "The cats at your adoption ceneter were just all too cute! One day you woke up and all the cats from your center had been stolen away by people who just couldn't handle all of their cuteness! You've been run out of business.",
    rightChoiceText: "Not my cats!",
    rightChoice: function(){
      location.reload();
    },
    leftChoiceText: "How can cats be TOO cute?", 
    leftChoice: function(){
      location.reload();
    },
    name: "Narrator",
    resultText: "",
    image: "./images/NarratorCat.jpg"
  }},
  {resource:"cuteness", 
  level: "low", 
  card: {
    prompt: "No one finds the cats at your adoption center cute enough to adopt! Now no one will ever come around and adopt them! Your cat adoption business has failed.",
    rightChoiceText: "My cats are perfectly cute!",
    rightChoice: function(){
      location.reload();
    },
    leftChoiceText: "The cats are too good for them anyways!", 
    leftChoice: function(){
      location.reload();
    },
    name: "Narrator",
    resultText: "",
    image: "./images/NarratorCat.jpg"
  }},
  {resource:"fierceness", 
  level: "high", 
  card: {
    prompt: "All of the cats at your adoption center have become incredibly fierce and rowdy! They've overthrown you and taken over the adoption center for themselves!",
    rightChoiceText: "The cats overthrew me? Like as a business owner?",
    rightChoice: function(){
      location.reload();
    },
    leftChoiceText: "Those cats were a little TOO crazy.", 
    leftChoice: function(){
      location.reload();
    },
    name: "Narrator",
    resultText: "",
    image: "./images/NarratorCat.jpg"
  }},
  {resource:"fierceness", 
  level: "low", 
  card: {
    prompt: "The cats at your adoption center have become too skiddish, not fierce at all! They all ran away from the center, too afraid to associate with humans anymore.",
    rightChoiceText: "Not my cats!!!",
    rightChoice: function(){
      location.reload();
    },
    leftChoiceText: "Im sorry for scaring the cats away!", 
    leftChoice: function(){
      location.reload();
    },
    name: "Narrator",
    resultText: "",
    image: "./images/NarratorCat.jpg"
  }},
  {resource:"money", 
  level: "low", 
  card: {
    prompt: "You've completely ran out of money! Now you don't have enough money to care for any of the cats at your adoption center anymore. You've hand to close down the center and give up all the cats.",
    rightChoiceText: "I should have spend my money more wisely.",
    rightChoice: function(){
      location.reload();
    },
    leftChoiceText: "I might have taken in too many cats!", 
    leftChoice: function(){
      location.reload();
    },
    name: "Narrator",
    resultText: "",
    image: "./images/NarratorCat.jpg"
  }},
]

defaultFailCard = {
  prompt: "I don't know what went wrong, but it was something.",
  rightChoiceText: "Try again?",
  rightChoice: function(){location.reload();
    },
  
  leftChoiceText: "Try again?", 
  leftChoice: function(){location.reload();
  },
  name: "Narrator",
  resultText: "You made a mistake",
  image: "./images/NarratorCat.jpg"
}