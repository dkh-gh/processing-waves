
int cntX = 200;
int cntY = 150;

float[] pose = new float[cntX*cntY];
float[] impl = new float[cntX*cntY];

void setup() {
  size(800, 600);
  stroke(100, 160, 220);
  strokeWeight(1);
  noStroke();
  fill(100, 160, 220);
  
  for(int i = 0; i < cntX*cntY; i++) {
    pose[i] = 0;
    impl[i] = 0;
  }
}

void draw() {
  background(10, 20, 40);
  
  if(mousePressed) {
    int i = int(mouseY/4 * cntX + mouseX/4);
    impl[i] = 1500;
  }
  
  float[] tmp_impl = new float[cntX*cntY];
  for(int y = 1; y < cntY-1; y++) {
    for(int x = 1; x < cntX-1; x++) {
      
      int i = y*cntX + x;
      
      tmp_impl[i] = (
        pose[i-cntX-1]+pose[i-cntX]+pose[i-cntX+1]+
        pose[i-1]+     pose[i]+     pose[i+1]+
        pose[i+cntX-1]+
        pose[i+cntX]+
        pose[i+cntX+1]
      )/9;
      
    }
  }
  for(int i = 0; i < cntX*cntY; i++) {
    impl[i] += tmp_impl[i];
    impl[i] += -pose[i]*2;
    impl[i] *= .99;
    pose[i] += impl[i]/10;
  }
  
  for(int y = 1; y < cntY-1; y++) {
    for(int x = 1; x < cntX-1; x++) {
      int i = y*cntX + x;
      fill(128+pose[i]*10);
      circle(x*4, y*4, 5);
    }
  }
  
}
