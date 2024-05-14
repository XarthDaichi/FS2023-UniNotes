---
Topic: Arbol de Decisión
Date: 2024-03-11
Course: AI
tags:
  - notes
  - flashcards
  - AI
cards-deck:
---
Datos:
- $x$: DATA SET $m*n$ 
- $y$: TARGET $m*1$ 
	- $m$: # de ejemplos
	- $n$: # de features
- el target aprende por feature (cada 1 feature)
![[Arbol de Decisión 2024-03-11 13.11.45.excalidraw]]
Objetivo:
que la impureza de S > sumatoria de impurezas de los S_i

1. Qué es [[Impureza]]?
2. Cómo escoger a F?
	1. Se escoge el Feature que se encuentre que la diferencia entre los dos lados del objetivo sea mayor
![[Arbol de Decisión 2024-03-11 13.23.28.excalidraw]]
$$
min(\sum_{i=1}^{S_{n}^{F}}{Impureza(S_{i})})
$$

## Refinamiento
![[Arbol de Decisión 2024-03-14 13.07.55.excalidraw]]

también se puede usar ![[Gini]]
![[Arbol de Decisión 2024-03-18 13.21.26.excalidraw]]
[[Escogencia de t]]
