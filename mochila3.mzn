int: capacity;

array[1..3] of int: value = [45,48,35];
array[1..3] of int: weight = [5,8,3];

var set of 1..3: taken;

constraint sum(i in taken)(weight[i]) <= capacity;

var int: valu = sum(i in taken)(value[i]);

solve maximize valu;

output [show(taken), "   ", show(valu)];
