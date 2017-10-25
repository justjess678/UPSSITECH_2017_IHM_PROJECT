
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

float target_x = pos_x;
float target_y = pos_y;

float step_length = 32;

void draw () {
  while (!current_bus.actions_queue.isEmpty()) {
      
    target_x = pos_x;
    target_y = pos_y;
    MoveOrder next_order = current_bus.actions_queue.poll();
    switch (next_order.action) {
      case Deplacement: {
        switch (next_order.direction) {
          case VersHaut: {
            target_y -= step_length;
            break;
          }
          case VersBas: {
            target_y += step_length;
            break;
          }
          case VersGauche: {
            target_x -= step_length;
            break;
          }
          case VersDroite: {
            target_x += step_length;
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
  
  pos_x += (target_x - pos_x) / 10.0;
  pos_y += (target_y - pos_y) / 10.0;
  
  
  background(0);
  fill(255, 255, 255);
  noStroke();
  
  stroke(255, 0, 255);
  // text(width / 2, height / 2, "Action raw");
  
  ellipse(pos_x, pos_y, 32, 32);
}