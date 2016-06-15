%% Input de datos y generacion de variables de estado
close all
clear variables
clc


%Datos para la optimizacion
Q=1;                                %constante de generacion de feromona
alpha=0.5;                          %parametro de influencia
beta=2;                             %parametro de atractivo
ants=3;                             %numero de hormigas a utilizar
rho=0.8;                            %parametro de evaporacion de feromona
T=1:5;                             %vector de iteraciones
k=3;                                %numero de señales a leer
ds=zeros(1,size(T,2));              %vector de longitudes del recorrido

%Leer el archivo
importfile('A001STB1_1.mat');
EEGData=EEGData';
EEGData=EEGData(1:k,:);
xs=1:size(EEGData,2);

%generar matriz de nodos y borramos la data leida para ahorrar memoria, se
%llama al vector nodes, el encargado de generar el matriz de nodos.
nodes=Nodes(EEGData,xs);
clear EEGData 

%generar matriz de arcos, longitud de arcos y feromonas
[pherom,L]=Arcs(nodes);


%% Resolucion del problema
clear archs
%punto inicial 
n0=[1,1];
tours=zeros(size(nodes,2),2,ants);      %matriz que almacena los nodos recorridos

%iteracion en el vector T, para cada uno del t numero de iteraciones
%definidas, para el ants numero de hormigas

tic
for k=1:size(T,2);
    t=T(k);
    
    %para las t iteraciones definidas se realiza la optimizacion
    for i = 1:t
        %dado a que el recorrido de las hormigas es simultaneo, el vector
        %de probabilidades se calcula solo una vez para cada iteracion.
        probs=Probs(pherom,L,alpha,beta);
        %Se realiza la iteracion para cada una de las hormigas, la
        %actualizacion de fermonas se hace en otro ciclo, por lo que el
        %recorrido es simultaneo.
        for j=1:ants

            
            tours(:,:,j)=Tour(probs,n0);
            
        end
        
        %actualización de feromonas despues de que han pasado todas las
        %hormigas.        
        for j=1:ants
            pherom=(1-rho).*pherom+Dpher(pherom,tours(:,:,j),Q,L);
        end
            
    end
    
    %Se reinicia el vector de feromonas para volver a iterar para el
    %proximo t
    pherom=ones(size(L));
    
    %Se guarda en in vector la distancia tomada en el recorrido para el
    %numero t de iteraciones
    for i=2:size(nodes,2)
        ds(k)=ds(k)+L(i,tours(i,2,1),tours(i-1,2,1));
    end
    
end




%% Valores output y gráficos.


%outputs

time_optimizacion=toc;                      %tiempo utilizado en la optimizacion

optimo=zeros(1,size(nodes,2));
for i=1:size(nodes,2)
    optimo(i)=nodes(2,i,tours(i,2));        %Vector de nodos del recorrido optimo
end



% Graficos requeridos.


figure()
subplot(3,1,1);
for i=1:size(nodes,3)
    hold on
    plot(nodes(1,:,i),nodes(2,:,i));
    
end
title('Segmento(512:639) electrodo... Señal original')
hold off
subplot(3,1,2);
plot(T,ds);
xlabel('Numero de iteraciones T')
ylabel('Distancia total calculada')
title('Distancia total versus numero de iteraciones')

subplot(3,1,3);


for i=1:size(nodes,3)
    hold on
    plot(nodes(1,:,i),nodes(2,:,i));
end
plot(nodes(1,:,1),optimo,'b','LineWidth',1.5)
hold off
title('Minimun cost')
