---
Topic: Programación Dinámica
Date: 2023-11-11
Course: 
tags:
  - notes
  - flashcards
cards-deck:
---
![[Programación Dinámica 2023-11-11 13.44.22.excalidraw]]
[[Memoize]]
[[Optimalidad]]
[[Programming]]
# Problema del Triángulo de Pascal

![[Programación Dinámica 2023-11-11 14.47.49.excalidraw]]

```C
#define ll long long int;
ll memo[1000][10000];
ll cb(int n, int k) {
	if (n == k || !k) return 1;
	if (memo[n][k]) return memo[n][k];
	return memo[n][k] = memo[n][n-k] = cb(n-1, k) + cb(n-1, k-1);
}
```

# Problema De Números Triángulos
Utiliza este conocimiento [[Números Poligonales]]
![[Programación Dinámica 2023-11-11 15.14.16.excalidraw]]
```C
#define gauss(a) (a*(a+1))/2;
short int memo[1000000];
void llenar() {
	for (int i = 0; i * (i+1) < 1000000<<1; i++) {
		memo[(i*(i+1))/2] = 1;
	}
}
int mt(int n) {
	if (memo[n]) return memo[n];
	int var = 4;
	for (int i = 1; gauss(i) < n; i++) {
		var = min(var, 1 + mt(n-gauss(n)));
		return memo[n] = var;
	}
}
```
# Problema de Coin Change
Asuma que existen las siguientes monedas {500, 100, 50, 25, 10, 5, 1}
Cualquier numero menor a 1500 es n
Encuentre la cantidad de maneras que se puede dar el monto (n)
![[Programación Dinámica 2023-11-11 15.39.40.excalidraw]]
```C
#define ll long long int;
ll memo[1500][7];
int coins[7] = {1, 5, 10, 25, 50, 100, 500};
ll cc(int m, int i) {
	if (m < 0) return 0;
	if (m == 0 || (i == 0 && m > 0)) return 1;
	return memo[m][i] = cc(m-coins[i], i) + cc(m, i-1);
}
```

# Problema de la Mochila
![[Programación Dinámica 2023-11-11 15.50.40.excalidraw]]
![[Programación Dinámica 2023-11-11 15.54.41.excalidraw]]
# Problemas de Grafos
## Dijkstra
Path::Camino que no repite nodos
Camino::Camino pero puede repetir nodos
Esto es Dijkstra (explicación de abajo de por qué es Greedy)
![[Programación Dinámica 2023-11-11 16.04.57.excalidraw]]
## Prim/Kruskal
### Prim lo hace por nodos
Recorre en un nodo arbitrario agarra las aristas mínimas y después agarra la siguiente mínima
### Kruskal lo hace por aristas
Agarra las aristas y las ordena