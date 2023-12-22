---
type: homework
date: 2023-11-02
turned-in: false
status: Not Started
tags: homework
---
#  Autoestudio Semana 14a
1. Repase, revise, amplíe
	- Recursión de pila versus de cola
	- Árbol de Prueba, backtracking y cut
	- Backtracking como iterador
2. Sea la siguiente recurrencia f(n) n entero no negativo (digámosle super Fibonacci)
```
f(n) = n si n in (0,1,2)
f(n) = f(n-1) + f(n-2) + f(n-3) si n >=3
```
Escriba
a) `super_fibo(+N, -F)` recursive de pila que calcule `f(N)` en `F`.
```
super_fibo(N, F) :- member(N, [0,1,2]), F = N.
super_fibo(N, F) :- 
	N >= 3,
	N1 is N - 1, super_fibo(N1, F1),
	N2 is N - 2, super_fibo(N2, F2),
	N3 is N - 3, super_fibo(N3, F3),
	F is F1 + F2 + F3
.
```
b) `super_fibo_rec(+N, -F)` lo mismo pero recursiva de cola. verifique que `super_fibo` y `super_fibo rec` calculan lo mismo
```prolog
super_fibo_rec(N, N).
super_fibo_rec(N, F) :- 
	N >= 3, super_fibo_rec()
.

super_fibo_rec(I, N, F) :-
	
.
```
- [ ] TODO: terminar esta recursion de cola

3. Sin usar recursión ni metapredicados, escriba `split(+A, -L, -U)` talque `L` tiene la primera mitad de `A` y `U` la segunda mitad de `A`, asumiendo que `A` tiene una cantidad par de elementos.
```
?- split([1,2,3,4,5,6], L, U).
L = [1,2,3]
U = [4,5,6]
```
4. Escriba `slice(+L, +F, +T, -S)` que retorne en `S` la sublista de `L` desde posición `F` hasta posición `(T - 1).` 0 es la primera posición. Solo saca elementos tales que `0` =< `F` ... <= `T` < `N` donde `len(L, N)`
	Ejemplo de uso
	```
	?- slice([a,b,c,d,e,f,g], 2, 5, S).
	S=[c, d, e]

	?- slice([a,b,c,d,e,f,g], 3, 10, S).
	S=[d, e, f, g]

	?- slice([a,b,c,d,e,f,g], 3, 2, S).
	S=[]
	```

5. Escriba un metapredicado `take(:G, +T, +N, -L)` tal que `L` es la lista de (a lo más) los primeros N T'S que `G` genera
	Ejemplo de uso:
	```
	?- take(member(X, [-1,0,1,2,3,4,5,6,7]), X > 1, X < 5, sol(X), 3, L).
	L = [sol(2), sol(3), sol(4)]
	```
	