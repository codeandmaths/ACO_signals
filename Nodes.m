function nodes = Nodes(data,xs)
% Generaci�n de la matriz de nodos, una matriz 3d que posee 2 filas, para x
% e y de cada nodo. tantas columnas como el numero de datos de la se�al. Y
% se repite hacia adentro tantas veces como numero de se�ales.

s=size(data,1);
n=size(data,2);
nodes=zeros(2,n,s);

for i=1:s
    nodes(2,:,i)=data(i,:);
    nodes(1,:,i)=xs;
end
