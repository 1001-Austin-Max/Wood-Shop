class Bowl {
  ArrayList<Layer> layers = new ArrayList<Layer>();
  float totalThickness = 0;
  float totalRadius = 0;
  float[] pers = {1.2, 0}; //x rotation, translate down scale
  Bowl() {
  }

  void display() {
    showPreviews();
    for(Layer l : layers){
      l.display();
    }
  }

  void addLayer(Layer l) { //int num, float divWidth, float t, float r, float d, float x, float y
    editing = l;
    layers.add(l);
  }

  void removeLayer(Layer l) {
    
  }

  void editLayer(int i) {
    editing = layers.get(i);
  }
  
  void showPreviews(){
    int numberOfButtons = layers.size()+1;
    float barHeight = 0;
    if(numberOfButtons == 1){
      barHeight = height;
    } else {
      barHeight = height/3;
    }
    int currentX = 0;
    int xSpacer = width/numberOfButtons;
    for(int i = 0; i < numberOfButtons; i++){
      if(mouseX > currentX && mouseX <= currentX+xSpacer && mouseY > 0 && mouseY < barHeight && mousePressed){
        fill(#62C1E3);
        if(i != layers.size()){
          editing = layers.get(i);
        } else{
          addLayer(new Layer());
        }
      } else if(mouseX > currentX && mouseX <= currentX+xSpacer && mouseY > 0 && mouseY < barHeight){
        fill(#A3D2E3);
      }
      rect(currentX, 0, xSpacer, barHeight);
      
      currentX+=xSpacer;
    }
  }
}