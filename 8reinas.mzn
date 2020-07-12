array[1..1000] of var 1..1000: columnas;

constraint forall(i,j in 1..1000 where i > j)(columnas[i] != columnas[j]);
constraint forall(i in 1..1000 , j in i+1..1000)(columnas[i] != columnas[j] + (j-i));
constraint forall(i in 1..1000 , j in i+1..1000)(columnas[i] != columnas[j] - (j-i));

solve satisfy;