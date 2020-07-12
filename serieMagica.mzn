int: n;

set of int: lon = 0..n-1;


array[lon] of var int: serie;

constraint forall(i in lon)(serie[i] >= 0);
constraint forall(i in lon)(serie[i] = sum(j in lon) (serie[j] = i));