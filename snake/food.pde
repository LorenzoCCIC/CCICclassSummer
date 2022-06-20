//OM NOM
public class food {
  public boolean dead = false;
  
  food() {
    
  }
  
  void display() {
    
    if (dead == false) {
      fill(#E82570);
      rect(foodX*s, foodY*s, s, s);
    } else {
      foodX = int(random(0, 20));
      foodY = int(random(0, 20));
      for(int i = 0; i <= snake.size()-1; i++) {
        bod segment = snake.get(i);
        if (segment.x == foodX && segment.y == foodY) {
          apple.display();
        }
      }
      
      
      dead = false;
      
    }
    
  }
}
