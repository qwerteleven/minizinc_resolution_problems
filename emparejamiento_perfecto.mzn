include "globals.mzn";

int: n = 6;

set of int: vertex = 1..n;

array[vertex] of var vertex: parejas;

array[vertex, vertex] of int : weight =
        [|
          10000, 5,     3,     10000, 2,     10000|
          5,     10000, 10000, 3,     10000, 2|
          3,     10000, 10000, 4,     3,     10000|
          10000, 3,     4,     10000, 10000, 2|
          2,     10000, 3,     10000, 10000, 5|
          10000, 2,     10000, 2,     5,     10000|
          |];

var int: coste = sum(i in 1..round(n/2))(weight[i,parejas[i]]);

            
constraint alldifferent([parejas[i] | i in vertex]);
constraint forall(i in vertex)(i = parejas[parejas[i]]);
          
solve minimize coste;

output [show(parejas), show(coste)];
