---
Topic: Type
Date: 2023-08-24
Course: Paradigms
tags: notes paradigms
---

Def: familia de valores

Hay 2 tipos de types:
- Reference (Object)
	- Se construyen con new
	- normalmente el programa guarda un montón de memoria para guardar este tipo de types, cuando se le da new se le guarda espacio al HEAP
	- Dependen más de un garbage collector para vaciar la memoria innecesaria del HEAP
- Primitive
	- Se guardan en el stack
	- Un programador de C intenta usar solo este tipo para no tener que preocuparse de los new (punteros), para devolver memoria rápido
	- int, float, double, string, ... por eso se les ponen en minúsculas para diferenciarlos

![[Drawing 2023-08-24 18.27.51.excalidraw]]


Subtipo = <:
Supertipo = :>