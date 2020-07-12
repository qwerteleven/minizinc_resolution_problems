int: n;

array[1..n] of var 0..3: vec;

constraint vec[1] = 0;
constraint vec[n] = 3;
constraint forall(i in 1..n-1)(vec[i] + vec[i+1] <=3);
constraint forall(i in 1..n where i mod 3 == 0)(vec[i] >= 2);

solve maximize sum(vec);

output [show(vec), show(sum(vec))];