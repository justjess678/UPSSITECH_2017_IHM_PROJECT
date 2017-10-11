



void setup () {
  size(640, 360, FX2D);
  
  try {
    new IvyBus().start();
  } catch (IvyException e) {
    e.printStackTrace();
  }
}


int pos_x = 0;
int pos_y = 0;

void draw () {
  pos_x = mouseX;
  pos_y = mouseY;
  
  
  background(0);
  fill(255, 255, 255);
  noStroke();
  
  ellipse(mouseX, mouseY, 32, 32);
}