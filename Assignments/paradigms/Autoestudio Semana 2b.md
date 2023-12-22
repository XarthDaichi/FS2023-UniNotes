---
type: homework
date: 2023-08-17
turned-in: false
status: Not Started
tags: homework
---
#  Autoestudio Semana 2b
1. Repase y extienda estos conceptos
- Lenguaje: Faceta declarativa versus operativa
- Definición de clase versus instancia
- Método de clase versus instancia
- Tipos estáticos y su función
- Paquete (package) en Java
- Modificación de declaraciones (public, private, protected y ninguno. Investigar los no vistos en clase).
- Parámetros formales versus reales
- Compilación y AST de un operador ternario
- Desactivación del JIT y efectos

2. Haga ejemplos y compile para tratar de contestar las siguientes preguntas
	1. Sea C (en mayúscula) una class de Java y m y método estático en C asuma por simpleza de tipo void y sin parámetros formales. Sea c (minúscula) una instancia de C. ¿Sería válido: c.m()?

	2. Sea B que extiende a C. ¿Podría B tener un método estático void m() como lo tiene C?
	
	3. ¿Podría haber declaraciones de una A tal que un bloque de código Java así que compilara correctamente?
	```js
	A a = new A();
	a.foo();
	a.foo(a);
	a.foo(a, a, a);
	A[] b = new A[10];
	a.foo(b);
	```

3. Reescriba la función int fact (int n) de forma que no use un ternario sino un if-then-else estatuto. ¿Cambiará eso el código generado por el compilador de Java?

4. ¿Dibuje el AST de `h = Math.sqrt(a * a + - b * b)`? Asuma que = es un operador. Piense cómo debería armarse el árbol de forma que un post-order sea correcto al ejecutarlo en una stack machine?

5. Suponga que hay una clase A ddeclarada en un paquete a.b.c. Asuma que A.java está en una carpeta src y se quiere que javac deje su compilación en una carpeta classes. Asuma que A tiene main. Ambos src y classes debern estar en una carpeta project.

	1. ¿Qué habría que teclear en consola para poder compilar (según se pide)A?

	2. ¿Qué habría que teclear en consola para poder ejecutar A?
	
	3. ¿Qué habría que teclear para desensamblar A?

