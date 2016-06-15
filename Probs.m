function probs=Probs(pherom,L,alpha,beta)

%En base a la matriz de pheromonas, la matriz de longitudes de arcos y los
%parametros de atracción e influencia, generamos la probabilidad de elegir
%entre los nodos adyacentes. Esta probabilidad será del tipo multinomial,
%por lo que cada nodo tendrá una cierta p.


n=size(L,1);
s=size(L,3);
probs=zeros(size(L));
etas=1./L;


for k=1:s
    for j=1:s 
        for i=1:n
            suma=sum((etas(i,:,k).^beta).*(pherom(i,:,k).^alpha));
            
            probs(i,j,k)=(pherom(i,j,k)^alpha*etas(i,j,k)^beta)/(suma);
        end
    end
end


