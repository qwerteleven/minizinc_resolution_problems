array[1..5] of int :p = [11,18,15,17,11];

array[1..4] of int :r = [5000,7500,4000,3000];

array[1..4 , 1..5] of float: c =[|1.5, 2.0, 1.5, 0.5, 0.1
                                 |1.0, 0.0, 0.5, 1.0, 2.5
                                 |1.0, 2.0, 1.0, 0.9, 0.1
                                 |1.0, 0.0, 1.0, 1.5, 2.5|];
                                 
array[1..5] of var int: num;
                            
constraint forall (i in 1..5)(num[i] >= 0);    
constraint forall (i in 1..4)(sum(j in 1..5)(num[j] * c[i,j]) <= r[i]);

var int: valor = sum(i in 1..5)(num[i] * p[i]);

solve maximize valor;

output [show(num), "   ", show(valor)];