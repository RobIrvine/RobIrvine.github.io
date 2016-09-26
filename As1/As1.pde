float[] circleA = {random(10, 50), random(10, 50)};
float[] circleB = {random(10, 50), random(10, 50)};


float[][] twentyCircles = new float[20][];

void setup() {
  
  twentyCircles[0] = circleA;
  twentyCircles[0] = circleB;
  
  size (800, 800);
  background(123);
  
}

void draw() {
  background(123);
  fill(random(0, 255), random(0, 255), random(0, 255));
  for (int r=0; r < 20; r++) {
    ellipse(twentyCircles[r][0], twentyCircles[r][1], 50, 50);
  }
}