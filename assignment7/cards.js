
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
  "uniqueIDList" : ["explaination"],
  
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

}




