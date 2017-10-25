import de.voidplus.dollar.*;
import development.*;


IvyBus current_bus;

OneDollar one;
String name;


void setup () {
  size(64, 64, FX2D);
  //frameRate(30);
  
  
  try {
    current_bus = new IvyBus();
    current_bus.start();
  } catch (IvyException e) {
    e.printStackTrace();
  }
  
  
  // 1. Create instance of class OneDollar:
  one = new OneDollar(this);
  one.setVerbose(true);          // Activate console verbose
  //one.setMinSimilarity(10);
  
  println(one);                  // Print all the settings
}


int pos_x = 0;
int pos_y = 0;

void draw () {
  background(255);
  
  fill(0); noStroke();
  text("Detected gesture: "+name, 30, 40);
  text("Draw anticlockwise a circle or triangle.", 30, height-30);

  // Optional draw:
  one.draw();
}

// 5. Track data:
void mouseDragged(){
  if (record_example) {
    example_points.add(mouseX);
    example_points.add(mouseY);
  } else {
    one.track(mouseX, mouseY);
  }
}


// 4. Implement callbacks:
void detected(String gesture, float percent, int startX, int startY, int centroidX, int centroidY, int endX, int endY){
  println("Gesture: " + gesture+", "+startX + "/" + startY+", "+centroidX+"/"+centroidY+", "+endX+"/"+endY);    
  name = gesture;
}

ArrayList<Integer> example_points;
boolean record_example = false;

int example_counter = 0;
void keyReleased() {
  Position direction = null;
  
  switch (keyCode) {
    case UP: {
      example_counter++;
      example_points = new ArrayList<Integer>();
      record_example = true;
     
      break;
    }
    case DOWN: {
      record_example = false;
      int[] example_points_as_array = new int[example_points.size()];
      for (int n = 0; n < example_points.size(); n++) {
        example_points_as_array[n] = example_points.get(n);
      }
      
      println(one.learn("example" + example_counter, example_points_as_array));
      //one.forget("example");
      
      println(one.bind("example" + example_counter, "detected"));
      // one.off("example");
      
      break;
    }
  }
  
    
}