---
type: homework
date: 2023-10-23
turned-in: false
status: Done
tags:
  - homework
---
#  Autoestudio Semana 12a
1. Revise, repase, refuerce
	- Prolog: relaciones lógicas para modelar problemas
	- Diferencia entre función y relación
	- SWI-Prolog
	- Átomo vs Variable
	- Axioma o fact
	- Bidireccionalidad de parámetros
	- Consulta (importar) un .pl
	- Query: coma es and, punto-y-coma es or
	- Query como iterador
	- Regla condicional (:-)
2. Como complemento al modelo testing.pl hecho en clase sobre equipos y campeonatos
	1. Haga un predicado `team(NC, NO, AF)` de facts que modele un equipo, que incluye `NC`: átomo de nombre corto del equipo, `NO` átomo con el nombre oficial, `AF`: año fundación. Añada ese nuevo predicado a testing.pl
		Ejemplo: 
		`team(csh, 'Club Sport Herediano', 1921).`
		`% y los otros ...`
		Complete más el modelo datos con Wikipedia para `lda, darissa, etc`
		¿Cómo sería un query que dado el nombre oficial `NO` retorne `NC` el nombre corto?
	```
	%%% testing.pl
	% campeon(E, A) : true sii Equipo E fue campeon en año A
	% Equipo: csh, lda, csc, darissa, ...
	% Año: un entero
	% Axiomas o factos
	campeon(csh, 1921).
	campeon(csh, 1922).
	campeon(csc, 1923).
	campeon(csh, 1924).
	campeon(lib, 1925).
	campeon(lda, 1928).
	campeon(lda, 1939).
	campeon(ucr, 1943).
	campeon(darissa, 1952).
	campeon(darissa, 1953).
	campeon(darissa, 1956).


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

	?- team(NC, 'Club Sport Herediano', _).
	NC = csh.
	```

	2. Usando testing.pl con su respuesta a): ¿cuál query se usaría para tener los equipos (Nombre oficial) si los haya que fueron campeones en su año de fundación? (spoiler alert solo uno, por supuesto ;-))
	Respuesta: `?- campeon(NC, A), team(NC, NO, A).`


	3. Basado en lo aprendido en b): añada a testing.pl un predicado `campeonEnAgnoFundacion(E)` verdadero si equipo E (nombre corto) fue campeón en su año de fundación
		`% Asi`
		`campeonEnAgnoFundacion(E) :- campeon(E, A), team(E, _, A).

	4. Escriba un predicado `mismoAgnoFundacion(E1, E2, A)` que sea verdadero si los (distintos) equipos E1 y E2 fueron fundados en el mismo año A.
		`% Asi`
		`mismoAgnoFundacion(E1, E2, A) :- E1 \= E2, team(E1, _, A), team(E2, _, A).
		
		¿Qué sería el query `mismoAgnoFundacion(E1, E2, _) expresado en lenguaje humano en palabras)?`
		Respuesta: todas las parejas de equipos que se fundaron en el mismo año.
		
3. Estudie familia.pl y haga los ejercicios sugeridos ahí
```prolog
% FACTS

  

mujer(catalina).

mujer(dora).

mujer(raquel).

mujer(ana).

mujer(birgit).

mujer(tamara).

%

hombre(beto).

hombre(chico).

hombre(juan).

hombre(carlos).

hombre(pedro).

hombre(diego).

  

% progenitor(?P, ?H): P es el progenitor (padre o madre) de H

progenitor(catalina, beto).

progenitor(catalina, chico).

progenitor(catalina, raquel).

progenitor(pedro, beto).

progenitor(pedro, chico).

progenitor(pedro, raquel).

progenitor(beto, ana).

progenitor(beto, juan).

progenitor(beto, carlos).

progenitor(dora, ana).

progenitor(dora, juan).

progenitor(birgit, carlos).

progenitor(chico, diego).

progenitor(tamara, diego).

  
  

/*

catalina -------- pedro

   _________|_______________________________

  |                     |                   |

chico ----- tamara   raquel   brigit ----- beto ----- dora

        |                        |       ___|___

        |                        |      |       |

      diego                    carlos  ana    juan

  
  

*/

  

% PROGRAMAS SON  REGLAS (clausulas)

% definimos: papa, mama, hermano, abuelo, tio, primo, ancestro.

% papa(?P, ?H) P es un hombre y es progenitor de H

  

papa(X, Y) :-  hombre(X), progenitor(X, Y).

abuelo(X, Y)  :- hombre(X), progenitor(X, Z), progenitor(Z, Y).

sonHermanos(X, Y) :- progenitor(P, X), progenitor(P, Y), X\=Y.

  

ancestro(X, Y) :- progenitor(X, Y).

ancestro(X, Y) :- progenitor(X, Z), ancestro(Z, Y).

% Nota no funciona si hay recursion a la izquierda!

% ancestro(X, Y) :- ancestro(X, Z), ancestro(Z, Y).

% Se cicla infinitamente

%

% Colectando soluciones con "findall"

todos_los_hermanos(X, LS) :-

  findall(H, sonHermanos(X, H), L),

  sort(L, LS).

  

%Ejercicio: Elimine la llamada a sort. Explique por qué salen repetidos.

todos_los_hermanos_sin_sort(X, LS) :-

  findall(H, sonHermanos(X, H), LS).

  
  

%Ejercicio: escriba sonPrimos(X, Y): X y Y son primos: hijos de progenitors hermanos

sonPrimos(X, Y) :- progenitor(P1, X), progenitor(P2, Y), sonHermanos(P1, P2).
```
Sin el sort salen repetidos por el backtracking del AST de la solución, y como se presenta tanto en progenitor(madre, hij@) y progenitor(pardre, hij@), siendo hij@ es la misma persona.