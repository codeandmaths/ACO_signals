function next = Random(P)

%genera una distribuci�n multinomial con la funci�n built in de matlab,
%para generar la decisi�n de la hormiga, funci�n lenta, pero que garantiza
%la decisi�n aleatoria de la hormiga.

pd=makedist('Multinomial',P);
next=random(pd);


