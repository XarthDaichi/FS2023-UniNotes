---
Topic: Optimalidad
Date: 2023-11-11
Course: 
tags:
  - notes
  - flashcards
cards-deck:
---
![[Optimalidad 2023-11-11 13.45.52.excalidraw]]
![[Optimalidad 2023-11-11 14.27.13.excalidraw]]
Función en código
```C
bitset<1000005> visitado;
bool memo[1000005];

int g(int n) {
	if (n <= 0 || n == 1 || n == p || n ==k) return 1;
	if (visitado[n]) return memo[v];
	visitado[n] = 1;
	return memo[n] = !g(n-1) || !g(n-p) || ! g(n-k);
}
```

