int: nRecetas = 10;
set of int: RECETAS = 1..nRecetas;
array[RECETAS] of int: valor = [10,8,4,2,6,9,5,3,8,10];
int: nIngredientes = 8;
set of int: INGREDIENTES = 1..nIngredientes;

array[INGREDIENTES] of set of RECETAS: group =[{1,4,6},{1,2,6,7},{1,3,6,8},{1,2,3},{2,9,10},{5,6,8,10},{7,8,10},{1,3,5}];

var set of RECETAS: menu;
constraint card(menu) <= 3;
constraint forall(i in INGREDIENTES)(card(menu intersect group[i]) <= 1);
var int: valorNutricional = sum(m in menu)(valor[m]);
solve maximize(valorNutricional);

output ["Valor nutricional: \(valorNutricional) ->", show(menu)];