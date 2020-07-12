int: presupuesto;


array[1..4] of int: cost  = [13,21,17,100];
array[1..4] of int: max   = [1000,400,500,150];
array[1..4] of int: force = [6,10,8,40];
array[1..4] of var 0..1000: vec;


constraint forall(i in 1..4)(vec[i] <= max[i]);

constraint sum (i in 1..4)(vec[i]*cost[i]) <= presupuesto;

solve maximize sum(i in 1..4)(vec[i]*force[i]);

output [show(vec), "   ",show(sum(i in 1..4)(vec[i]*force[i])), "    ",show(sum (i in 1..4)(vec[i]*cost[i]))];