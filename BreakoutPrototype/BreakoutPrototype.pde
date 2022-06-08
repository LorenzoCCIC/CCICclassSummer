//Game for summer class
//Game: Breakout
//Requirements for end product: colision, paddle, disappearing bricks. 
//Variables
//noCursor();
//frameRate(30);
//size(1000,1000);

//INPUT
String value;
void draw() {
};

void keyPressed() {
  if (value == "0") {
    value = "255";
  } else {
    value =" 0";
  }
  print(keyCode);
};
 
