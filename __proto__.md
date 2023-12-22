---
Topic: __proto__
Date: 2023-10-02
Course: Paradigms
tags:
  - notes
  - paradigms
---

![[Pasted image 20231002184714.png]]
![[Meta Modelo OOP De JS 2023-10-02 18.47.28.excalidraw]]
\_\_proto\_\_ apunta al prototype de la clase que lo construye

Regla (Invariante)
$\forall x, x.\_\_proto\_\_=x.constructor.protorype$

El \_\_proto\_\_ apunta a al prototype del constructor, que apunta a una instancia "ejemplo", este es un gasto de memoria para que no se tenga que hacer un if una instancia ha sido creada, por lo tanto el gasto de memoria ayuda al rendimiento y no afecta tanto en costo total.

La estructura ocurre así por el [[Algoritmo de Búsqueda de Propiedades]]