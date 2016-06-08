float x;
float y;
float controlPanelX, controlPanelWidth;
Layer l; 
Layer editing;
PImage plus;

Bowl b;
void setup(){
  size(1000,700,OPENGL);
  plus = loadImage("images/plus-icon.png");
  controlPanelWidth = 250;
  x = (width/2);
  y=height/2;
  controlPanelX = width-controlPanelWidth;
  //editing = new NormalLayer();
  b = new Bowl();
  //b.addLayer(new NormalLayer());
}
void draw(){
  background(255);
  if(editing == null){
    b.display();
  }
  else{
    fill(150);
    noStroke();
    rect(controlPanelX, 0, controlPanelWidth, height);
    fill(0);
    textSize(25);
    if(editing == b.layers.get(b.layers.size()-1)){
      text("New Layer", editing.xSpace, 20);
    }else {
      text("Edit Layer", editing.xSpace, 20);
    }
    editing.typeList.display();
    editing.numberOfSegments.display();
    editing.thicknessSlid.display();
    editing.radiusSlid.display();
    editing.depthSlid.display();
    editing.divSlid.display();
    editing.display("3D", 0);
  }
}

float start = 0;
boolean dragging = false;
void mouseClicked(){
  start = mouseY;
}
void mouseDragged(){
  start = pmouseY;
  if(editing == null){
    dragging = true;
    b.pers += (start-mouseY)/(20*TWO_PI);
  }
}

void mouseReleased(){
  dragging = false;
}

void keyPressed(){
  if(editing != null){
    if(inchesToPixels(editing.radiusSlid.val) > b.biggestRadius){
      b.biggestRadius = inchesToPixels(editing.radiusSlid.val);
    }
    editing = null;
    x = width/2;
    y = 2*height/3;
  }
}

float inchesToPixels(float val) { //36 inches = 800pixels
  return val*(200/9);
}

void shape3D(PVector[] vertices, float t) {
  fill(255);
  beginShape();//top
  for (int i = 0; i < vertices.length; i++) {
    vertex(vertices[i].x, vertices[i].y, t);
  }
  endShape(CLOSE);
  beginShape();//bottom
  for (int i = 0; i < vertices.length; i++) {
    vertex(vertices[i].x, vertices[i].y, 0);
  }
  endShape(CLOSE);

  beginShape();
  vertex(vertices[0].x, vertices[0].y, t);
  vertex(vertices[1].x, vertices[1].y, t);
  vertex(vertices[1].x, vertices[1].y, 0);
  vertex(vertices[0].x, vertices[0].y, 0);
  endShape();
  beginShape();
  vertex(vertices[1].x, vertices[1].y, t);
  vertex(vertices[2].x, vertices[2].y, t);
  vertex(vertices[2].x, vertices[2].y, 0);
  vertex(vertices[1].x, vertices[1].y, 0);
  endShape();
  beginShape();
  vertex(vertices[2].x, vertices[2].y, t);
  vertex(vertices[3].x, vertices[3].y, t);
  vertex(vertices[3].x, vertices[3].y, 0);
  vertex(vertices[2].x, vertices[2].y, 0);
  endShape();
  beginShape();
  vertex(vertices[3].x, vertices[3].y, t);
  vertex(vertices[0].x, vertices[0].y, t);
  vertex(vertices[0].x, vertices[0].y, 0);
  vertex(vertices[3].x, vertices[3].y, 0);
  endShape();
}