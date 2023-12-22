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
  |                     |                   |
chico ----- tamara   raquel   brigit ----- beto ----- dora
        |                        |       ___|___
        |                        |      |       |
      diego                    carlos  ana    juan


*/

% PROGRAMAS SON  REGLAS (clausulas)
% definimos: papa, mama, hermano, abuelo, tio, primo, ancestro.
% papa(?P, ?H) P es un hombre y es progenitor de H

papa(X, Y) :-  hombre(X), progenitor(X, Y).
abuelo(X, Y)  :- hombre(X), progenitor(X, Z), progenitor(Z, Y).
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