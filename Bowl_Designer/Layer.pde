class Layer {
  DropDownList typeList;
  Counter numberOfSegments;
  Slider thicknessSlid;
  Slider radiusSlid;
  Slider depthSlid;
  Slider divSlid;
  float startY = 50;
  float ySpacer = 40;
  float xSpace = controlPanelX+20;
  float slidWidth = 150;
  float elemHeight = 50;
  float countWidth = 100;
  String[] opt = {"Normal", "Divided"};

  Layer() {
    startY+=ySpacer+25;
    typeList = new DropDownList(xSpace, startY, slidWidth, elemHeight, opt, "Type Of Layer"); 
    startY+=ySpacer;
    startY+=typeList.h;
    numberOfSegments = new Counter(xSpace, startY, countWidth, 12, #69B9E3, "Number Of Segments");
    startY+=ySpacer;
    startY+=numberOfSegments.h; //float x, float y, float w, float h, float min, float max, float s, String title, color background, color sliderColor
    thicknessSlid = new Slider(xSpace, startY, slidWidth, elemHeight, 0.25, 12, 0.25, "Thickness", #69B9E3, #2F96CB);
    startY+=ySpacer;
    startY+=elemHeight;
    radiusSlid = new Slider(xSpace, startY, slidWidth, elemHeight, 0.25, 36, 9, "Radius", #69B9E3, #2F96CB);
    startY+=ySpacer;
    startY+=elemHeight;
    depthSlid = new Slider(xSpace, startY, slidWidth, elemHeight, 0, 22, 4, "Depth", #69B9E3, #2F96CB);
    startY+=ySpacer;
    startY+=elemHeight;
    divSlid = new Slider(xSpace, startY, slidWidth, elemHeight, 0, 10, 0, "Divider Width", #69B9E3, #2F96CB);
  }
  
  void display(String mode, int stroke){
    if(editing == this){
      typeList.active = true;
      numberOfSegments.active = true;
      thicknessSlid.active = true;
      radiusSlid.active = true;
      depthSlid.active = true;
      depthSlid.active = true;
    } else {
      typeList.active = false;
      numberOfSegments.active = false;
      thicknessSlid.active = false;
      radiusSlid.active = false;
      depthSlid.active = false;
      depthSlid.active = false;
    }
    if(typeList.current != typeList.name){
      depthSlid.max = radiusSlid.val;
      radiusSlid.min = depthSlid.val;
      if(typeList.current == "Normal"){
        float segs = numberOfSegments.val;
        float anglePerSegment = TWO_PI/numberOfSegments.val;
        float radius = inchesToPixels(radiusSlid.val);
        float thickness = inchesToPixels(thicknessSlid.val);
        float depth = inchesToPixels(depthSlid.val);
        pushMatrix();
        translate(x,y);
        for(int i = 0; i < segs; i++){
          PVector[] vertices = new PVector[4];
          vertices[0] = new PVector(-(radius-depth)*tan(anglePerSegment/2), -(radius-depth), 0);
          vertices[1] = new PVector(-radius*tan(anglePerSegment/2), -radius, 0);
          vertices[2] = new PVector(radius*tan(anglePerSegment/2), -radius, 0);
          vertices[3] = new PVector((radius-depth)*tan(anglePerSegment/2), -(radius-depth), 0);
          fill(255);
          stroke(stroke);
          strokeWeight(3);
          if(mode == "3D"){
            shape3D(vertices, thickness);
          } if(mode == "2D"){
            beginShape();
            for(int j = 0; j < vertices.length; j++){
              vertex(vertices[j].x, vertices[j].y);
            }
            endShape(CLOSE);
          }
          rotate(anglePerSegment);
        }
        popMatrix();
      }
    }
  }
  
  void displayPreview(float prevX, float prevY, float maxHeight, int stroke){ //radius = 100 maxheight = 20 scale factor = 20/100 = 0.2 radius*scale factor = 20
    float origX = x;
    float origY = y;
    x = prevX;
    y = prevY;
    float scaleFactor = maxHeight/inchesToPixels(radiusSlid.val);
    pushMatrix();
    translate(x, y, -inchesToPixels(thicknessSlid.val)+1);
    scale(scaleFactor);
    translate(-x,-y);
    display("2D", stroke);
    popMatrix();
    x = origX;
    y = origY;
  }
}