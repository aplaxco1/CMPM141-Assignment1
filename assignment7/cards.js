
firstCard = {
  prompt: "Welcome to the Cat Adoption Center game!",
  rightChoiceText: "How do I play?",
  rightChoice: function(){
      addToTopDeck("explaination")
    },
  
  leftChoiceText: "I'm ready to start!", 
  leftChoice: function(){
    cats += 2;
    addRandomPack()
    addRandomPack()
    addPackToDeck("adoptableCats")
  },
  name: "Narrator",
  resultText: "",
  image: "./images/NarratorCat.jpg",
  priority: 1,
  pack : "none"
}


cardPool = {
  "uniqueIDList" : ["explaination", "allCatsAdopted", "runningSmoothly"],
  
  "explaination" : {
    prompt: "Your goal is to take care of the cats in your shelter until they are adopted by loving families. To do so, you need to maintan a stable level of cuteness, happiness, and fierceness of the cats at your shelter so that people will be enouraged to adopt them!",
    rightChoiceText: "Got it!",
      rightChoice: function(){
        cats += 2; 
        addRandomPack()
        addRandomPack()
        addPackToDeck("adoptableCats")
      },
    leftChoiceText: "Alright lets go!", 
    leftChoice: function(){
      cats += 2; 
        addRandomPack()
        addRandomPack()
        addPackToDeck("adoptableCats")
    },
    name: "Narrator",
    resultText: "",
    image: "./images/NarratorCat.jpg",
    priority: 2,
    pack : "none"
  },

  "allCatsAdopted" : {
    prompt: "All of the cats from your adoption center have been adopted by loving families! Congratulations!",
    rightChoiceText: "Lets play again!",
      rightChoice: function(){
        location.reload();
      },
    leftChoiceText: "Lets play again!", 
    leftChoice: function(){
      location.reload();
    },
    name: "Narrator",
    resultText: "",
    image: "./images/NarratorCat.jpg",
    priority: 2,
    pack : "none"
  },

  "runningSmoothly" : {
    prompt: "While not all of the cats at your adoption center have been adopted, everything is still going very well! These remaining cats will likely be adopted in the near future!",
    rightChoiceText: "Lets play again!",
      rightChoice: function(){
        location.reload();
      },
    leftChoiceText: "Lets play again!", 
    leftChoice: function(){
      location.reload();
    },
    name: "Narrator",
    resultText: "",
    image: "./images/NarratorCat.jpg",
    priority: 2,
    pack : "none"
  }
}




