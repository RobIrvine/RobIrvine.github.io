class myFace {
  
  void paint(){
    paint(mouseX, mouseY);
  }
  
  void paint(int xPos, int yPos){
    pushMatrix();
    translate(xPos, yPos);
    
    fill(255, 255, 0);
    ellipse(0, 0, 100, 100);
    
    fill(255);
    ellipse(-25, -15, 10, 10);
    ellipse(25, -15, 10, 10);
    
    popMatrix();
  }
}