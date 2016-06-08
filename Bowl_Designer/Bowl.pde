class Bowl {
  ArrayList<Layer> layers = new ArrayList<Layer>();
  float biggestRadius = 0;
  float pers = 1.2; //x rotation, translate down scale
  Bowl() {
  }

  void display() {
    showPreviews();
    pushMatrix();
    translate(x,y);
    rotateX(pers);
    scale(scaleToFit(2*biggestRadius, width/3));
    translate(-x,-y);
    for(Layer l : layers){
      l.display("3D", 0);
      translate(0,0,l.thicknessSlid.val);
    }
    popMatrix();
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
    float currentX = 0;
    float xSpacer = width/numberOfButtons;
    int s = 0;
    tint(255,255,255);
    for(int i = 0; i < numberOfButtons; i++){
      s = 0;
      if(mouseX > currentX && mouseX <= currentX+xSpacer && mouseY > 0 && mouseY < barHeight && mousePressed && !dragging){
        s = #62C1E3;
        x = (width/2)-controlPanelWidth;
        y = height/2;
        if(i != layers.size()){
          editing = layers.get(i);
          break;
        } else{
          addLayer(new Layer());
          break;
        }
      } else if(mouseX > currentX && mouseX <= currentX+xSpacer && mouseY > 0 && mouseY < barHeight){
        s = #A3D2E3;
        if(i == layers.size()){
          tint(0,0,0);
        }
      }
      if(i == layers.size()){
        s = 0;
      }
      //rect(currentX, 0, xSpacer, barHeight);
      
      if(i != layers.size()){
        layers.get(i).displayPreview(currentX+(xSpacer/2), barHeight/2, barHeight/2 , s);
      } else{
        pushMatrix();
        translate(currentX+(xSpacer/2), barHeight/2);
        scale(412/((numberOfButtons*xSpacer)));
        translate(-currentX-(xSpacer/2), -barHeight/2);
        imageMode(CENTER);
        image(plus, currentX+(xSpacer/2), barHeight/2);
        popMatrix();
      }
      currentX+=xSpacer;
    }
  }
}

float scaleToFit(float origDim, float newDim){
  return newDim/origDim;
}