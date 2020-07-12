int: capacity;

array[1..3] of int: value = [45,48,35];
array[1..3] of int: weight = [5,8,3];

array[1..3] of var 0..1: taken;

constraint sum(i in 1..3 where taken[i] > 0)(weight[i]) <= capacity;

var int: valu = sum(i in 1..3 where taken[i] > 0)(value[i]);

solve maximize valu;

output [show(taken), "   ", show(valu)];
