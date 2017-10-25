import java.util.concurrent.ConcurrentLinkedQueue;

import fr.dgac.ivy.* ;

class IvyBus {
  private ConcurrentLinkedQueue<MoveOrder> actions_queue;
  private Ivy bus;

  public IvyBus() throws IvyException {
    this.actions_queue = new ConcurrentLinkedQueue();
    
    bus = new Ivy ("gen", "IvyTranslater Ready", null);
    
    bus.bindMsg("^sra5 Parsed=(.*) Confidence=(.*)", new IvyMessageListener() {
      public void receive(IvyClient client, String[] args) {
        Origin origin = Origin.Speech;
        String pseudo_raw = "";
        Action order_action;
        Position order_direction;
        MoveOrder order;
        
        
        try {
          String order_action_as_string = args[0].trim().split(" ")[0].trim().split(":")[1];
          order_action = Action.fromString(order_action_as_string);
        } catch (Exception e) {
          e.printStackTrace();
          return;
        }
        
        
        try {
          String order_direction_as_string = args[0].trim().split(" ")[1].trim().split(":")[1];
          order_direction = Position.fromString(order_direction_as_string);
        } catch (Exception e) {
          e.printStackTrace();
          return;
        }
        
        
        order = new MoveOrder(origin, pseudo_raw, order_action, order_direction);
        println(args[0] + ", " + args[1] + " | " +order);
        
      }
    });
    
    
    bus.bindMsg("^gra Parsed=(.*) Confidence=(.*)", new IvyMessageListener() {
      public void receive(IvyClient client, String[] args) {
        Origin origin = Origin.Gesture;
        String pseudo_raw = "";
        Action order_action;
        Position order_direction;
        MoveOrder order;
        
        try {
          String order_action_as_string = args[0].trim().split(" ")[0].trim().split(":")[1];
          order_action = Action.fromString(order_action_as_string);
        } catch (Exception e) {
          e.printStackTrace();
          return;
        }
        
        try {
          String order_direction_as_string = args[0].trim().split(" ")[1].trim().split(":")[1];
          order_direction = Position.fromString(order_direction_as_string);
        } catch (Exception e) {
          e.printStackTrace();
          return;
        }
        
        order = new MoveOrder(origin, pseudo_raw, order_action, order_direction);
        println(args[0] + ", " + args[1] + " | " +order);
        
      }
    });
    
  }
  
  
  public void start() throws IvyException {
    this.bus.start(null);
  }
  
  public void stop () throws IvyException {
    bus.stop();
  }
}