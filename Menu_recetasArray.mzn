int: nRecetas = 10;
int: nIngredientes = 8;
int: numPlatos = 3;

set of int: Recetas = 1 .. nRecetas;
set of int: Ingredientes = 1 .. nIngredientes;

array [Recetas] of int: valor = [10,8,4,2,6,9,5,3,8,10];
array [Ingredientes] of set of Recetas: group = [{1,4,6},{1,2,6,7},{1,3,6,8},{1,2,3},{2,9,10},{5,6,8,10},{7,8,10},{1,3,5}];

array [1..numPlatos] of var 0 .. nRecetas: menu;

var int: valorNutricional = sum(m in 1..numPlatos where menu[m]>0)(valor[menu[m]]);

constraint forall(i in Ingredientes)(sum(j in 1..numPlatos)(card({menu[j]} intersect group[i])) <= 1);

constraint forall(i in 1 .. numPlatos-1)(menu[i] >= (menu[i]!=0) + menu[i+1]);


solve maximize valorNutricional;

output [show(valorNutricional), "   ", show(menu)];

