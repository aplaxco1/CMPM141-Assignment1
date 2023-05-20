cats = 0;


function updatePlayerData(){
  
  
let dataToShow = "CATS IN SHELTER: "+ cats;


io.writeIntoElement(dataToShow,"playerData")

}