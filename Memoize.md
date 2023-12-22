---
Topic: Memoize
Date: 2023-11-11
Course: 
tags:
  - notes
  - flashcards
cards-deck:
---
![[Memoize 2023-11-11 13.45.42.excalidraw]]
Fibonacci sin dinámica
```C
int f (int n) {
	if (n == 1 || !n) return n;
	return f(n-1) + f(n-2);
}
```
Si se hace f(100), en esta versión puede superar la edad de la tierra para solucionar. Porque el tiempo es $O(2^n)$
![[Memoize 2023-11-11 13.57.55.excalidraw]]
Fibonacci con [[Programación Dinámica]]
```C
int memo[1000];
int f (int n) {
	if (n==1 || !n) return n;
	if (memo[n]) return memo[n];
	return memo[n] = f(n-1) + f(n-2);
}
```
Complejidad es $O(n)$
