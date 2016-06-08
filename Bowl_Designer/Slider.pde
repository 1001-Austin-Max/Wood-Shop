class Slider {
  //one unit of val is equal to the width/limit 
  //80 sections out of 100 pixels
  float x, y, w, h, val, min, max, size, start, increment, sliderPosition, sliderX, sliderY, endPos, sliderSize; //x and y align to top left
  String title;
  color background, sliderColor;
  color textColor = 0;
  color add;
  boolean active = true;
  //val is in the increment of width/limit
  Slider(float x, float y, float w, float h, float min, float max, float s, String title, color background, color sliderColor) {
    this.x = x; //pixels \/
    this.y = y;
    this.w = w;
    this.h = h;
    this.max = max; //units
    this.min = min; //units
    this.start = s-min; //units
    val = constrain(start, min, max);
    size = max-min; //units
    increment = (size)/w; //pixels
    sliderSize = 5;//pixels
    sliderY = y;
    sliderX = x+(start*increment);
    this.background = background;
    this.sliderColor = sliderColor;
    this.title = title;
  }

  void display() {
    noStroke();
    mouseOver();
    fill(background + add);
    rect(x, y, w, h);
    fill(sliderColor + add-10);
    rect(sliderX, sliderY, sliderSize, h);
    textAlign(LEFT, BOTTOM);
    fill(textColor);
    text(title, x, y - 4);
    textAlign(LEFT, TOP);
    text(val, sliderX, y+h+4);
  }

  boolean holding = false;
  void mouseOver() {
    if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h && mousePressed && active) {
      holding = true;
    } 
    if (holding) {
      sliderX = constrain(mouseX, x, x+w-sliderSize);
      val = constrain(increment*(mouseX-x)+min, min, max);
      add = color(0, 0, 15);
      if (!mousePressed) {
        holding = false;
      }
    } else {
      add = color(0, 0, 0);
    }
    if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h && !holding) {
      add = color(0, 0, 5);
    }
  }
}