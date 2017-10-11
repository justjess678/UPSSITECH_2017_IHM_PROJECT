import java.util.Map;
import java.util.HashMap;

enum Action {
  Deplacement("deplacement");


  private final String string_repr;


  private static final Map<String, Action> values = new HashMap<String, Action>();
  static {
    for (Action g : Action.values()) {
      if (values.put(g.string_repr, g) != null) {
        throw new IllegalArgumentException("duplicate value: " + g.string_repr);
      }
    }
  }


  private Action (String option) {
    this.string_repr = option;
  }


  public static Action fromString (String option) {
    return values.get(option);
  }
}

enum Position {
  VersGauche("a_gauche"), VersDroite("a_droite"), VersHaut("en_haut"), VersBas("en_bas");
    
    
  private final String string_repr;


  private static final Map<String, Position> values = new HashMap<String, Position>();
  static {
    for (Position g : Position.values()) {
      if (values.put(g.string_repr, g) != null) {
        throw new IllegalArgumentException("duplicate value: " + g.string_repr);
      }
    }
  }


  private Position (String option) {
    this.string_repr = option;
  }


  public static Position fromString (String option) {
    return values.get(option);
  }
}

class VoiceOrder {
  public final Action action;
  public final Position direction;

  public VoiceOrder (Action action, Position direction) {
    this.action = action;
    this.direction = direction;
  }
  
  public String toString() {
    return this.action + " : " + this.direction;
  }
}