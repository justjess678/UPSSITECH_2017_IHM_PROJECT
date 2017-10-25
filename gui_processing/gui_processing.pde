
IvyBus current_bus;




void setup () {
  size(640, 360, FX2D);
  
  try {
    current_bus = new IvyBus();
    current_bus.start();
  } catch (IvyException e) {
    e.printStackTrace();
  }
}


float pos_x = 64;
float pos_y = 64;

void draw () {
  while (!current_bus.actions_queue.isEmpty()) {
    MoveOrder next_order = current_bus.actions_queue.poll();
    switch (next_order.action) {
      case Deplacement: {
            
        switch (next_order.direction) {
          case VersHaut: {
            pos_x += 0.0;
            pos_y -= 1.0;
            break;
          }
          case VersBas: {
            pos_x += 0.0;
            pos_y += 1.0;
            break;
          }
          case VersGauche: {
            pos_x -= 1.0;
            pos_y += 0.0;
            break;
          }
          case VersDroite: {
            pos_x += 1.0;
            pos_y += 0.0;
            break;
          }
          
          default: {
            println("Caramba, cé quoi ce binz?");  
          }
            
        }
        break;
      }
      
      default: {
        println("Caramba, cé quoi ce binz?");  
      }
    }
  }
  
  //pos_x = mouseX;
  //pos_y = mouseY;
  
  
  background(0);
  fill(255, 255, 255);
  noStroke();
  
  stroke(255, 0, 255);
  // text(width / 2, height / 2, "Action raw");
  
  ellipse(pos_x, pos_y, 32, 32);
}