import java.util.concurrent.ConcurrentLinkedQueue;

import fr.dgac.ivy.* ;

class IvyBus {
  private ConcurrentLinkedQueue<MoveOrder> actions_queue;
  private Ivy bus;

  public IvyBus() throws IvyException {
    this.actions_queue = new ConcurrentLinkedQueue();
    
    bus = new Ivy("gui", "IvyTranslater Ready", null);
    
    
    bus.bindMsg("^sra5 Action=(.*) Direction=(.*)", new IvyMessageListener() {
      public void receive(IvyClient client, String[] args) {
        MoveOrder new_order = new MoveOrder("sra5", args);
        actions_queue.add(new_order);
        
      }
    });
    
    
    bus.bindMsg("^gra Action=(.*) Direction=(.*)", new IvyMessageListener() {
      public void receive(IvyClient client, String[] args) {
        MoveOrder new_order = new MoveOrder("gra", args);
        
        actions_queue.add(new_order);
        
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