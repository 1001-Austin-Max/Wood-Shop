float x;
float y;
Layer l; 
Layer editing;

Bowl b;
void setup(){
  size(1000,800, P3D);
  x= width/2;
  y= height-300;
  b = new Bowl();
  b.addLayer(new NormalLayer(10, 20, 250,250)); //int num, float divWidth, float t, float r, float d
  //editing = b.layers.get(0);
  b.addLayer(new NormalLayer(10, 30, 300, 50));
  b.addLayer(new SegmentedLayer(10, 20, 30, 350, 50));
  b.addLayer(new SegmentedLayer(10, 20, 100, 400, 50));
  b.addLayer(new SegmentedLayer(10, 20, 30, 420, 50));
  b.addLayer(new SegmentedLayer(10, 20, 30, 500, 120));
}
void draw(){
  background(255);
  if(editing == null){
    //translate(0,10*b.layers.size(),10*b.layers.size());
    b.display();
  }
  else{
    editing.display(width/2,height/2);
  }
}
float start = 0;
void mouseClicked(){
  start = mouseY;
}
void mouseDragged(){
  start = pmouseY;
  b.pers[0] += (start-mouseY)/(20*TWO_PI);
}

void keyPressed(){
  editing = null;
}