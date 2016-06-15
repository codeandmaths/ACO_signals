function [pherom,L]=Arcs(nodes)
%Funcion que entrega los posibles nodos de movimiento, entrega para cada
%nodo los nodos a los que la hormiga se puede mover, en este sentido define
%los arcos posibles para le problema.

s=size(nodes,3);
n=size(nodes,2);




pherom=(ones(n,s,s));
L=(zeros(n,s,s));




for k=1:s
    for i=1:n-1
        for j=1:s
            A=nodes(:,i,k);
            B=nodes(:,i+1,j);
           
            dAB=norm(B-A);
            
            L(i,j,k)=dAB;
            
        end
    end
end
    
                