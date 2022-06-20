Movie  m;
Movie  spindt;
Movie  hated;

void setup() {
  size(100,100);
  m = new Movie(20000000, "computor", "computre==");
  spindt = new Movie(1500000, "moonlight", "drama");
  hated = new Movie(20000000, "we can be heroes", "action");

  println(m.allData());
  println();
  println(spindt.allData());
  println();
  println(hated.allData());
}

void draw() {
  
}
