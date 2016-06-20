# ACO_signals

Con este codigo se leen los datos de las señales en el documento input.mat, despues se generan los nodos respectivos y 
se realiza l optimización según el método de la colonia de hormigas, con un numero determinado de iteraciones y un número 
determinado de hormigas.

En cada iteracion:

-Se calculan las probabilidades de cada uno de los arcos
.Se eligen los arcos según la distribucion correspondiente
-Se actualizan los niveles de feromona segun los recorridos
-Se actualizan los niveles de feromona segun evaporacion.
