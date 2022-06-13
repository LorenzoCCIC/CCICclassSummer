String[] foods = {"Carbonara", "Ice Cream", "Cotton Candy"};
print(foods);
foods[0] = "     Califlower";
print(foods);
foods[foods.length-1] = "Eggplant";
print(foods);

int[][] matrix = {
{1, 2, 3, 4, 5, 6, 7, 8, 9},
{-1, 0, 1, 3, 4, 5, 6, 7, 8},
{-2, -1, 0, 1, 2, 3, 4, 5, 6, 7},
{-3, -2, -1, 0, 1, 2, 3, 4, 5, 6},
{-4, -3, -2, -1, 0, 1, 2, 3, 4, 5},
{-5, -4, -3, -2, -1, 0, 1, 2, 3, 4},
{-6, -5, -4, -3, -2, -1, 0, 1, 2},
{-7, -6, -5, -4, -3, -2, -1, 0, 1},
{-8, -7, -6, -5, -4, -3, -2, -1, 0},
};
println();
print(matrix[4][2]);
