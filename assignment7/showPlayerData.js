cats = 0;
adoptedCats = [];


function updatePlayerData(){
  
  
let dataToShow = "CATS IN SHELTER: "+ cats;
dataToShow += "\nCATS ADOPTED: ";
for (x in adoptedCats) {
    dataToShow += adoptedCats[x];
    if (x != (adoptedCats.length - 1)) {
        dataToShow += ", ";
    }
}


io.writeIntoElement(dataToShow,"playerData")

}