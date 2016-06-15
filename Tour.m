function tours=Tour(probs,n0)

%Generamos la eleccion de los arcos a tomar en base al vector de
%probabilidades.

%Se llama a la función Random que se encarga de manejar el vector de
%probabilidades.

n=size(probs,1);
s=size(probs,3);
tours(1,:)=n0;

for i =2:n
    aux=probs(i-1,:,tours(i-1,2));
    next=Random(aux);
    tours(i,:)=[i,next];
end