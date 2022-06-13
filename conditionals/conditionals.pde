int ooh;
float QFinBP;
float QFinBN;
float[] vars = {1,2,-3};
ooh = 25;
if ((ooh % 5 == 0) && (ooh % 3 == 0)) {
  print(ooh + " is a multiple of three and five");
} else if (ooh % 3 == 0) {
  print(ooh + " is a multiple of three");
} else if (ooh % 5 == 0){
  print(ooh + " is a multiple of cinq");
} else {
  print(ooh + " is a failure");
}
QFinBP = 34404;
QFinBN = 34404;
println();

if (vars[0] != 0){
  QFinBP = ((-1*vars[1] + sqrt(vars[1]*vars[1] + (-4*vars[0]*vars[2])))/2*vars[0]);
  QFinBN = ((-1*vars[1] - sqrt(vars[1]*vars[1] + (-4*vars[0]*vars[2])))/2*vars[0]);
}

print(QFinBP + "," + QFinBN);
