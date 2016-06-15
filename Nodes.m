function nodes = Nodes(data,xs)
% Generación de la matriz de nodos, una matriz 3d que posee 2 filas, para x
% e y de cada nodo. tantas columnas como el numero de datos de la señal. Y
% se repite hacia adentro tantas veces como numero de señales.

s=size(data,1);
n=size(data,2);
nodes=zeros(2,n,s);

for i=1:s
    nodes(2,:,i)=data(i,:);
    nodes(1,:,i)=xs;
end
