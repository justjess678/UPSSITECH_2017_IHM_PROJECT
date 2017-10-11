import java.util.concurrent.ConcurrentLinkedQueue;

import fr.dgac.ivy.* ;

class IvyBus {
  private ConcurrentLinkedQueue<Action> actions_queue;
  private Ivy bus;

  public IvyBus() throws IvyException {
    this.actions_queue = new ConcurrentLinkedQueue();
    
    bus = new Ivy("IvyTranslater", "IvyTranslater Ready", null);
    
    // Subscribing to 
    bus.bindMsg("^sra5 Parsed=(.*) Confidence=(.*)", new IvyMessageListener() {
      public void receive(IvyClient client, String[] args) {
        Action order_action;
        Position order_direction;
        VoiceOrder order;
        
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
        
        order = new VoiceOrder(order_action, order_direction);
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