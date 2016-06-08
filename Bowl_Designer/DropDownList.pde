class DropDownList {
  float x, y, w, h;
  String[] options;
  String name;
  String current;
  boolean active = true;
  
  DropDownList(float x, float y, float w, float h, String[] o, String name){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    options = o;
    this.name = name;
    current = name;
  }
  
  void display(){
    stroke(0);
    strokeWeight(1);
    fill(255);
    rect(x, y, w, h);
    textAlign(LEFT,CENTER);
    textSize(15);
    fill(0);
    text(current, x+2, y+(h/2)-3);
    triangle(x+w-20, y+(h/3), x+w-10, y+(h/3), x+w-15, y+13);
    checkMouseOver();
    if(opt){
      showOptions();
    }
  }
  boolean opt = false;
  void checkMouseOver(){
    if(mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h && mousePressed && active){
      opt =true;
    }
  }
  
  void showOptions(){
    int count = 0;
    for(float cursY = y+h; cursY < y+h+options.length*h; cursY+=h){
      fill(255);
      if(mouseX > x && mouseX < x+w && mouseY > cursY && mouseY < cursY+h){
        fill(100,100,255);
        if(mousePressed){
          current = options[count];
          opt = false;
        }
      }
      pushMatrix();
      translate(0,0,1);
      rect(x, cursY, w, h);
      fill(0);
      textAlign(LEFT, CENTER);
      text(options[count], x+2, cursY+(h/2)-3);
      count++;
      popMatrix();
    }
  }
}