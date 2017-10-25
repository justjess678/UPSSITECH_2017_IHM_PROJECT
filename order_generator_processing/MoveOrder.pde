import java.util.Map;
import java.util.HashMap;


enum Origin {
  Gesture("gra"), Speech("sra5");
  

  private final String string_repr;

  private Origin (String option) {
    this.string_repr = option;
  }
  
  public String toString() {
    return this.string_repr;
  }


  private static final Map<String, Origin> enums_for_strings = new HashMap<String, Origin>();
  
  static {
    for (Origin g : Origin.values()) {
      if (enums_for_strings.put(g.string_repr, g) != null) {
        throw new IllegalArgumentException("duplicate value: " + g.string_repr);
      }
    }
  }

  public static Origin fromString (String option) {
    return enums_for_strings.get(option);
  }
}


enum Action {
  Deplacement("deplacement");


  private final String string_repr;

  private Action (String option) {
    this.string_repr = option;
  }
  
  public String toString() {
    return this.string_repr;
  }


  private static final Map<String, Action> enums_for_strings = new HashMap<String, Action>();
  
  static {
    for (Action g : Action.values()) {
      if (enums_for_strings.put(g.string_repr, g) != null) {
        throw new IllegalArgumentException("duplicate value: " + g.string_repr);
      }
    }
  }

  public static Action fromString (String option) {
    return enums_for_strings.get(option);
  }
}

enum Position {
  VersGauche("a_gauche"), VersDroite("a_droite"), VersHaut("en_haut"), VersBas("en_bas");
    
    
  private final String string_repr;


  private Position (String option) {
    this.string_repr = option;
  }
  
  public String toString() {
    return this.string_repr;
  }


  private static final Map<String, Position> values = new HashMap<String, Position>();
  
  static {
    for (Position g : Position.values()) {
      if (values.put(g.string_repr, g) != null) {
        throw new IllegalArgumentException("duplicate value: " + g.string_repr);
      }
    }
  }



  public static Position fromString (String option) {
    return values.get(option);
  }
} 



class MoveOrder {
  public final Origin origin;
  public final String pseudo_raw;
  public final Action action;
  public final Position direction;

  public MoveOrder (Origin origin, String pseudo_raw, Action action, Position direction) {
    this.origin = origin;
    this.pseudo_raw = pseudo_raw;
    this.action = action;
    this.direction = direction;
  }
  
  public MoveOrder(String origin_as_string, String[] args) {
    this(
      Origin.fromString(origin_as_string), 
      "", 
      Action.fromString(args[0]), 
      Position.fromString(args[1])
    );
  }
  
  public String toString() {
    return this.origin.string_repr + " " + "Action=" + this.action + " " + "Direction=" + this.direction;
  }
}