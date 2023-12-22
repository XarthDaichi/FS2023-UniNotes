% Comantario de una linea
/*
Multilinea
*/

% campeon(E, A) : true sii Equipo E fue campeon en año A
% Equipo: csh, lda, csc, darissa, ...
% Año: un entero
% Axiomas o facts
campeon(csh, 1921).
campeon(csh, 1922).
campeon(csc, 1923).
campeon(csh, 1924).
campeon(lib, 1925).
campeon(lib, 1926).
campeon(lda, 1928).
campeon(lda, 1939).
campeon(ucr, 1943).
campeon(daprissa, 1952).
campeon(daprissa, 1953).
campeon(daprissa, 1957).
campeon(lda, 1958).
campeon(lda, 1959).
campeon(lda, 1960).

team(csc, 'Club Sport Cartagines', 1906).
team(lda, 'Liga Deportiva Alajuelense', 1919).
team(csh, 'Club Sport Herediano', 1921).
team(darissa, 'Deportivo Saprissa', 1935).
team(sg, 'Santos de Guapiles', 1961).
team(adsc, 'Asociacion Deportiva San Carlos', 1865).
team(adg, 'Asociacion Deportiva Guanacasteca', 1973).
team(ml, 'Municipal Liberia', 1977).
team(mpz, 'Municipal Perez Zeledon', 1991).
team(mg, 'Municipal Grecia', 1998).
team(pfc, 'Puntarenas Futbol Club', 2004).
team(sfc, 'Sporting Football Club', 2016).
team(lib, 'Club Sport La Libertad', 1905).

campeonEnAgnoFundacion(E) :- campeon(E, A), team(E, _, A).
mismoAgnoFundacion(E1, E2, A) :- E1 \= E2, team(E1, _, A), team(E2, _, A).