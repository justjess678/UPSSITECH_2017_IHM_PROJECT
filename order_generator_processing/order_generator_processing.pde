
IvyBus current_bus;


void setup () {
  size(64, 64, FX2D);
  //frameRate(30);
  
  
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
  if (!keyPressed) {
    return;
  }
  background(random(0, 255));
}


void keyReleased() {
  Position direction = null;
  
  switch (keyCode) {
    case UP: {
      direction = Position.VersHaut;
      break;
    }
    case DOWN: {
      direction = Position.VersBas;
      break;
    }
    case LEFT: {
      direction = Position.VersGauche;
      break;
    }
    case RIGHT: {
      direction = Position.VersDroite;
      break;
    }
  }
  
  if (direction != null) {
    
    MoveOrder new_order = new MoveOrder(Origin.Speech, "", Action.Deplacement, direction);
    
    try {
      current_bus.bus.sendMsg(new_order.toString());
      
    } catch (IvyException e) {
      e.printStackTrace();
    }
    
    println(frameCount + " - Sent:\n\t" + new_order);
  }
    
}