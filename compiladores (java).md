---
Topic: compiladores (java)
Date: 2023-08-07
Course: Paradigms
tags: notes paradigms
---

```java
public class Determinante{
	public static int det(int a, int b, int c) {
		return b*b - 4*a*c;
	}
}
```

Se intenta WORA (write once run always)

El compilador genera un archivo byte code, para que el interpretador (maquina virtual) lo ejecute

Es lento porque hay doble ejecución: la ejecución sobre el hardware y la ejecución sobre la máquina virtual

javap es un descompilador

Abstract Syntax Tree (AST):
El compilador genera todo el código en un AST, y lo recorre en un Post-Orden (LeftRightRoot)

Post-Orden (aka. notación polaca inversa): bb\*4a\*c\*- 

![[Drawing 2023-08-07 19.05.38.excalidraw]]


```
public class Determinante {
  public Determinante();
    Code:
       0: aload_0
       1: invokespecial #1                  // Method java/lang/Object."<init>":()V
       4: return

  public static int det(int, int, int);
    Code:
       0: iload_1
       1: iload_1
       2: imul
       3: iconst_4
       4: iload_0
       5: imul
       6: iload_2
       7: imul
       8: isub
       9: ireturn
}
```
```java
public class Determinante{
	public static int det(int a, int b, int c) {
		return b * b - 4 * a * c;
	}
	public static int howManySolutions(int a, int b, int c) {
		var x = det(a, b, c);
		if (x > 0) { return 2; }
		if (x == 0) { return 1; }
		return 0;
	}
}
```
```mermaid
graph TD
1([Source .java])
2[Compiler]
3([Target .class])
4[VM]
5([Results])

1 ---> 2
2 ---> 3
3 ---> 4
4 ---> 5
2 -- Compilation Errors --> 1
3 -- Runtime/Logic Errors --> 5

```
Dentro del compilador:
```mermaid
graph TD
1([Source])
2[Analisis Sintáctico]
3([AST + Tabla simbolos ST])
4[Typer - Analizador Semántica estático]
5[Code Generator]
6([Target])

1 ---> 2
2 -- Syntax Errors --> 1
2 ---> 3
3 ---> 4
4 ---> 5
5 -- Emisor --> 5
5 ---> 6
```
Tipos de errores de sintaxis:
- se olvido un ;
- se olvido un (
- Mal uso de palabras reservadas

[[Typer]]: busca pulgas de semántica