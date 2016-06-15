function dpher=Dpher(pherom,tour,Q,L)

t=size(tour,1);
dpher=zeros(size(pherom));



for i=2:t
    a=tour(i-1,2);
    b=tour(i,2);
    dpher(i-1,a,b)=Q/L(i-1,a,b);
end