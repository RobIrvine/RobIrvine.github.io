float[][] myCircles = new float[20][6]; 

void setup() {
  
  size(600, 600);
  background(123);
  
  for(int i=0; i < 20; i++) {
  
  int xPos = int(random(600));
  int yPos = int(random(600));
  int cSize = int(random(10, 50));
  int r = int(random(255));
  int g = int(random(255));
  int b = int(random(255));
  
  myCircles[i][0] = xPos;
  myCircles[i][1] = yPos;
  myCircles[i][2] = cSize;
  myCircles[i][3] = r;
  myCircles[i][4] = g;
  myCircles[i][5] = b;

}
}

void draw() {
  background(123);
    for (int r=0; r < 20; r++) {
    fill(myCircles[r][3], myCircles[r][4], myCircles[r][5]);
    ellipse(myCircles[r][0], myCircles[r][1], myCircles[r][2], myCircles[r][2]);
  }
}