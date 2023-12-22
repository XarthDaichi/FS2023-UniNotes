---
Topic: Typer
Date: 2023-08-24
Course: Paradigms
tags: notes paradigms
---
# Typer
[[Type]]: familia de valores
Def: Sistema Formal de Razonamiento sobre tipos (types) (Tema muy fuerte de ciencia de la computación (Computer Science))
Temas relacionados a: Teoría de Categorías

Propósito: Garantizar type safety

Type safety: no ocurra en ejecución que no ocurran cosas malas o contradictorias a la lógica
```Java
String y = "hola";
Integer x = y; // Esto es una cosa mala no puede ocurrir por el typer
/*
 * Si algo como esto ocurre por accidente en Java la maquina virtual se cae para
 * no tocar cosas que no debería tocar
 * Como ocurre en C, que si algo así ocurre en C podes llegar hasta tocar el SO
 */
```


Como sirve el Typer
```java
Number x = 666;
/*
 * el 666 es un int (primitive)
 * Number es una clase abstracta (reference)
 * lo que hace el typer para no detener ejecucuión
 * entonces hace un new Integer(666)
 * Esto se llama Boxing
 */
Integer x = 666;
x += 666; // el + solo sirve con primitivos (cosas de java)
/* 
 * Tiene que hacer Unboxing de x, devolver un int (envez de Integer)
 * Después de hacer la operación vuelve a hacer un Boxing
 */
4 + "" // en jshell devuelve un "4", conversión

```

Si en jshell se escribe:
```java
var x = 666; // crea un int, porque gasta menos espacio de memoria
```
![[Drawing 2023-08-24 18.40.11.excalidraw]]


>[!info] Probador de teoremas
>Typer es un probador de teoremas para ver si asignaciones u operaciones son válidas
>Es como [[Prolog]]

Pasos:
1. 666:int (Axioma)
2. x:Number (User given)
3. Number:>int --> FALSO!!!! (pudo haber detenido aca) || BOXING --> Number:>Integer --> TRUE!!!! (para que el usuario no tenga que escribir tanto)
	1. esto implica que hace un Number:>int o despues un BOXING y hace un Number:>Integer (un if) Si y solo si lo puede boxing (tiene otros axiomas que puede intentar)
	2. Number x = "666" no lo acepta llega al paso 3 y como no tiene reglas de BOXING aceptable entonces falla

![[Drawing 2023-08-24 19.02.41.excalidraw]]

```java
int x = null;
// es invalido porque null <: reference y int <: primitive
Integer x = null;
// es valido porque null <: reference y Integer <: reference
```


`int x = 666`
1. 666 : int (Axioma de clases enteros)
2. x : int (Dado por el código)
3. x = 666 (int <: int y 1,2)

int x = 666L
1. 666 : long (Axioma de clases long)
2. x : int (Dado por el código) 
3. x = 666 (int ~<: long) => Falso