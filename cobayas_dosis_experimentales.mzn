include "globals.mzn";

set of int: vitaminas = 1..20;
set of int: cobayas  = 1..9;

array [cobayas] of var vitaminas: dosis;

constraint alldifferent([dosis[i] | i in cobayas]);

constraint forall(i,j,k in cobayas where dosis[i] < dosis[j] \/ dosis[j] < dosis[k])(dosis[i] - dosis[j] != dosis[j] - dosis[k]);

solve satisfy;