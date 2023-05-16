function distance (a, b){
  return Math.sqrt( Math.pow(a.x - b.x, 2) + Math.pow(a.y - b.y, 2)) 
  
}

function randomInt(min, max) { 
  return Math.floor(Math.random() * (max - min + 1) + min)
}