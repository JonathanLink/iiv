void setup() { 
  size(400, 800, P2D); 
  //noLoop();
  frameRate(1);
}


void draw() {

  background(255, random(255), random(255));

  plant(15, 0.4, 0.8);
}

void leaf() { 
  beginShape();
    fill(51,102,0);
    vertex(100.0, -70.0);
    bezierVertex(90.0, -60.0, 40.0, -100.0, 0.0, 0.0);
    bezierVertex(0.0, 0.0, 100.0, 40.0, 100.0, -70.0);
  endShape();
}

void plant(int numLeaves, float minLeafScale, float maxLeafScale) { 
  stroke(51,102,0);
  line(width/2, height/3, width/2, 2*height/3); // the plant's stem

  int gap = height/numLeaves; // vertical spacing between leaves 
  float angle = 0;
  
  for (int i=0; i<numLeaves; i++) {
    int x = width/2;
    int y = gap*i/3 + (int)random(gap);
    float scale = random(minLeafScale, maxLeafScale);
    
    pushMatrix();
    translate(x,y+(height/3));
    scale(scale);
    rotate(angle);
    leaf();
    popMatrix();
    
    angle += PI; // alternate the side for each leaf
   } 
}
