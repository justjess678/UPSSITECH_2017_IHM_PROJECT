
IvyBus current_bus;


void setup () {
  size(64, 64, FX2D);
  
  try {
    current_bus = new IvyBus();
    current_bus.start();
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
  
  stroke(255, 0, 255);
  // text(width / 2, height / 2, "Action raw");
  
  ellipse(mouseX, mouseY, 32, 32);
  
  
  while (!current_bus.actions_queue.isEmpty()) {
    MoveOrder next_order = current_bus.actions_queue.poll();
    
    try {
      current_bus.bus.sendMsg(next_order.toString());
      
    } catch (IvyException e) {
      e.printStackTrace();
    }
    println(frameCount + " - Aggregated:\n\t" + next_order);
  }
}