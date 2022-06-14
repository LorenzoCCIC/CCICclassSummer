/*for(int i = 0; i<=1000; i++) {
  println(i);
  
}

int i = 1;
while (i<=100) {
  print(i*2 + ", ");
  i++;
}

println();
println();

String[] arr =  {"s", "t", "o", "c", "o", "c", "a", "t", "s"};
boolean pal = true;

for(int n = 0;n <= arr.length-1; n++) {
  if (arr[n] == arr[arr.length-n-1]) {
    pal = true;
  } else {
   print("it is not a palindrome");
   pal = false;
   return;
  }
  
}

if (pal == true) {
  print("it is a palindrome.");
}*/

int[][] num = {
  {2, 9, 0},
  {1, 3, 5},
  {2, 4, 7},
  {8, 1, 5}
};

for (int[] row: num) {
  for (int item: row) {
    print(item);
  }
  println();
}

for (int[] col: num) {
  print(col[0]);
}
println();
for (int[] col: num) {
  print(col[1]);
}
println();
for (int[] col: num) {
  print(col[2]);
}
println();
