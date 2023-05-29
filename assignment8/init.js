manager = new narrativeManager();


window.addEventListener("load", function() {
  //alert('Page is loaded'
    console.log(manager.canLoad())
  if (manager.canLoad()){
    manager.load()
    console.log("loaded")
  }
  manager.data.beats = beats;
  console.log(manager.data)
  manager.data.pagesVisited[document.title] = true;
 
  manager.run();
  
});