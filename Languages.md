---
Topic: Languages
Date: 2023-08-03
Course: Paradigms
tags: notes paradigms
---

A paradigm is a way to view reality, like looking through glasses when needed, without them its all blurry, with them one sees things that you could not previously see.

![[EIF400_II_2023_Part_A_Introduccion_Lenguajes_Paradigmas_Contexto.pdf]]

Abstracciones: El PM te da una abstracción de lo que necesita y hay que reducir las abstracciones para un mejor producto

Entre más abstracción, menos detalle. A menos abstracción hay más detalles

LN: Lenguaje Natural
LP: Lenguaje Programado
![[Drawing 2023-08-07 18.13.42.excalidraw]]
Óptimo sería que el LN == LP o que LP $\subset$ LN

Imaginarse una pirámide (toca dibujar después)
Entre más abajo en la pirámide reduce la productividad y el mantenimiento del software y menor seguridad
- Nivel cero (foundation de la pirámide pero no importante para la abstracción) HARDWARE: donde se tiene la memoria, la CPU, los registros (REGS), Operations Nemónicos (ADD, MUL, SUB, DIV, JMP, CMP, MOV (mover de la memoria al CPU o viceversa))
- Primer Nivel ASSEMBLER: con la menor abstracción hay que pensar en más detalles (para sumar 2 números hay que hacer muchísimos pasos en ensamblador, los MOVs, el ADD, etc.), solo para trabajar muy cerca del hardware (a la hora de drivers o sistemas operativos)
- Segundo Nivel LENGUAJES DE PROGRAMACIÓN: originalmente es lenguajes como COBOL (common o... business o... l...), FORTRAN (alto rendimiento y ciencia), LISP (artificial intelligence). Estos lenguajes son estandarizados (COBOL se estandarizó por Grace Hopper) y usados en mainframes (computadoras de alto rendimiento).
	- variable types
	- Tienen cosas como variables
	- Records (Structs)
	- Go To
	- Spaghetti Code
- Tercer Nivel LENGUAJES DE ALTO NIVEL: promueve la programación estructurada, los lenguajes que compiten en C y Pascal y gana C. Paradigma Imperativo porque uno le da ordenes a la compu
	- for
	- while
	- {}
	- if-then-else
	- asignaciones, x = 100
	- Punteros (\*)
	- & referencias
- Cuarto Nivel OOP (object-oriented programming): originalmente impulsado por SIMULA, sale C++ y objective-C, gana C++, trae clases
- Quinto Nivel Java para que sirviera en todo, porque salió el internet
- Sexto Nivel MULTICORE: por la concurrencia entonces sale lenguajes como Go o RUST
- Séptimo Nivel: Lenguaje Natural

| Lenguaje | OOP | Pointers | Memoria Manejada Automáticamente |
| ---------- | ----- | --------- | ---------- |
| C | x | Sí | No |
| C++ | Sí, pero no puro | Sí | No |
| Java | Sí, pero no puro | No | Sí |
| JS | Sí | No | Sí |
| Python | Sí | No | Sí |
| C# | Sí (casi) | Sí | Sí |
| Go | Sí? | | No
| RUST | Sí? | | Si/No (compilador no compila si detecta leaks) |

"Saber cuantas soluciones tiene una cuadratica"

Expresión: Algo que representa un valor
e.g. $b^{2}-4ac$ o `!true || x` 

Estatuto: `for() {}` 