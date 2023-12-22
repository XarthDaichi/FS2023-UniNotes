---
type: homework
date: 2023-10-26
turned-in: false
status: Done
tags:
  - homework
---
#  Autoestudio Semana 13a
1. Revise, Repase, Amplíe
	- Prolog es un Probador de Teoremas
	- Árbol de Prueba (Resolución)
	- Búsqueda de prueba DFS
	- Backtracking
	- atom vs compound
	- Compound como AST
	- Des-estructuración de JS versus Unificación de Prolog
2. Considere este programa:
```prolog
p :- p, q.
p.
q.
```
¿Qué hará Prolog si se le pide probar `p`? (trate de responder sin usar el shell?) Dibuje el Árbol de Prueba. Sea preciso en sus respuesta.
Se va a ciclar por la recursión izquierda.
- [ ] TODO: dibujar el árbol AST, hecho en papel, copiar

3. Dibuje el AST de `[[[], [1], [[2]]]]`
- [ ] TODO: dibujar el árbol AST, hecho en papel, copiar

4. ¿Describa en palabras de manera precisa qué hace este predicado `queHago(+L:List, -M:List` ?
`queHago([ F, S, T | R ], [T, S | [F | R]]).`
Se cambia el orden de los primeros 3 elementos

```
[a,b,c,d,e]
F = a
S = b
T = c
R = [d,e]

% EXPLICACION DE SOLUCION
= [c, b | [a | [d,e]]]
= [c,b,a | [d,e]]
= [c,b,a,d,e]
```

5. Escriba `n_esimo(+L:List, +N:number, -E:term)` que es `true` sii E es el n-ésimo elemento de la lista L (donde 0 es el primero). No use `nth` de Prolog o similares, haga una implementación propia. Use recursión.
`1 ?- n_esimo([a, b, c, d], 2, E).`
`E=c`
```
%% BOTTOM UP
n_esimo(L, K, E) :-
	K >= 0, length(L, N), K < N,
	n_esimo(L, 0, K, E)
.
n_esimo([E | R], K, K, E) :- !.
n_esimo([_ | R], I, K, E) :- I1 is I + 1,
	n_esimo(R, I1, K, E)
.


%% TOP DOWN
n_esimo([E | _], 0, E) :- !.
n_esimo([_ | R], N, E) :- N1 is N - 1, n_esimo(R, N1, E).
```
