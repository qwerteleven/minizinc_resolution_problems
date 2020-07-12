include "globals.mzn";

set of int: participante = 1..16;
set of int: partidos     = 1..4;
set of int: rondas       = 1..5;

array[partidos, rondas] of var set of participante: torneo;

constraint forall(i in partidos, j in rondas)(card(torneo[i,j]) = 4);

constraint forall(j in rondas)(forall(i,k in partidos where k != i)(card(torneo[i,j] intersect torneo[k,j]) = 0));

constraint forall(i in partidos, j in rondas)(forall(k in partidos, l in rondas where k != i \/ l != j)(card(torneo[i,j] intersect torneo[k,l]) <= 1));

solve satisfy;

output [show(torneo[i,j]) ++ 
         if j == 5 then "\n" else " " endif |
         i in partidos, j in rondas];