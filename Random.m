function next = Random(P)

%genera una distribución multinomial con la función built in de matlab,
%para generar la decisión de la hormiga, función lenta, pero que garantiza
%la decisión aleatoria de la hormiga.

pd=makedist('Multinomial',P);
next=random(pd);


