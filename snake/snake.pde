public int score = 0;

public ArrayList<bod> snake = new ArrayList<bod>();

public boolean death = false;
public String direction = "null";
public int s = 40;
public int playX = 4, playY = 4 ;
public int pauseUpdate = 0;
public int foodX = 3, foodY = 5;
public food apple = new food();

void setup() {
  size(800,800);
  snake.add(new bod(4,4, "null"));
  movement();
} 

void draw() {
  
  if (pauseUpdate+200-score*2 <= millis()) {
  background(#0C7914);
  fill(#02080F);
  text(score, 10, 10);
  if (death == true) {
    textSize(25);
    text("YOU DIED BY HITTING SOMETHING VIOLENTLY. This is how well you did you sneaky snek: " + score, 200, 200);
      
    
  } else {
    movement();
    apple.display();
  }
  pauseUpdate = millis();
  }
  
}
void mouseClicked(){
  loop();
}
void keyPressed() {
  print(keyCode);
  if (keyCode == 38) {
    if (direction != "down") {
      direction = "up";
    }
  } else if (keyCode == 39) {
    if (direction != "left") {
      direction = "right";
    }
  } else if (keyCode == 37) {
    if (direction != "right") {
      direction = "left";
    }
  } else if (keyCode == 40) {
    if (direction != "up") {
      direction = "down";
    }
    
  }
}

void movement() {
  for(int i = 0; i <= snake.size()-1; i++) {
    bod segment = snake.get(i);
    segment.display();
  }
  
  if (direction == "up") {
    if (playY <= 0) {
      death = true;
    } else {
      snake.add(new bod(playX, playY-1,"up"));
      playY -= 1;
    }
    
  } else if (direction == "right") {
    if (playX+1 >= 20) {
      death = true;
    } else {
      snake.add(new bod(playX+1, playY,"right"));
      playX += 1;
    }
    
  } else if (direction == "left") {
    if (playX <= 0) {
      death = true;
    } else {
      snake.add(new bod(playX-1, playY,"left"));
      playX -= 1;
    }
    
  } else if (direction == "down") {
    if (playY+1 >= 20) {
      death = true;
    } else {
      snake.add(new bod(playX, playY+1,"down"));
      playY += 1;
    }
    
  }
  
  if ((playY == foodY && playX == foodX && apple.dead == false)) {
    apple.dead = true;
    score++;
    return;
  } else if (direction == "null") {
    
  }else {
    snake.remove(0);
  }
  
}
