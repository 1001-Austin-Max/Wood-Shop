class Counter {
  float x, y, w, h, bWidth;
  int val;
  color buttonColor;
  int plusAdd, minusAdd;
  String name;

  Counter(float x, float y, float size, int start, color buttonColor, String name) {
    this.x = x;
    this.y = y;
    this.w = size;
    h = w/3;
    bWidth = w/3;
    this.val = start;
    this.buttonColor = buttonColor;
    this.name = name;
  }

  void display() {
    checkMouseOver();
    noStroke();
    fill(buttonColor+minusAdd);
    rect(x, y, bWidth, h);
    fill(buttonColor+plusAdd);
    rect(x+(bWidth*2), y, bWidth, h);
    fill(255);
    strokeWeight(1);
    stroke(0);
    rect(x+bWidth, y, bWidth, h);
    textAlign(CENTER, CENTER);
    fill(0);
    text(val, x+(w/2), y+(h/2));
    textAlign(LEFT, BOTTOM);
    text(name, x, y-5);
    
    drawSymbols();
  }
  
  void drawSymbols(){
    strokeWeight(bWidth/20);
    stroke(0);
    float cursX = x;
    float padding = bWidth/5;
    
    line(cursX+padding, y+(h/2), cursX+bWidth-padding, y+(h/2));
    cursX+=2*bWidth;
    line(cursX+padding, y+(h/2), cursX+bWidth-padding, y+(h/2));
    line(cursX+(bWidth/2), y+padding, cursX+(bWidth/2), y+h-padding);
  }
  boolean added = false;
  boolean subbed = false;
  void checkMouseOver() {
    if (mouseX > x && mouseX < x+bWidth && mouseY > y && mouseY < y+h && mousePressed) {
      minusAdd = 30;
      if(!subbed){
        val--;
        subbed = true;
      }
    } else if (mouseX > x && mouseX < x+bWidth && mouseY > y && mouseY < y+h) {
      minusAdd = 20;
      subbed = false;
    } else {
      minusAdd = 0;
      subbed = false;
    }

    if (mouseX > x+(bWidth*2) && mouseX < x+w && mouseY > y && mouseY < y+h && mousePressed) {
      plusAdd = 30;
      if(!added){
        val++;
        added = true;
      }
    } else if (mouseX > x+(bWidth*2) && mouseX < x+w && mouseY > y && mouseY < y+h) {
      plusAdd = 20;
      added = false;
    } else {
      plusAdd = 0;
      added = false;
    }
  }
}