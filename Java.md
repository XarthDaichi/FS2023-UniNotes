---
Topic: Java
Date: 2023-08-21
Course: Paradigms
tags: notes paradigms
---

Java name comes from the coffee type

Interface: clase que define los métodos de las clases que la heredan, pero no puede generar un estado de esta clase, después de Java 8 si se puede implementar código en las interfaces

Interface Comparator<\T>

T es como el template en C++ (Parámetro de tipo)
e.g. T = Person, T = Integer, T = List<\Person>

Comparator es un tipo genéricos, que tiene un parámetro de tipo
Tiene '[[Generics]]', que tiene tipos genéricos parametrizados

```java
static <T, U extends Comparable<? super U>>
comparing(Function<? super T, ? extends U> keyExtractor)
```

Function es una función [[lambda]].

Java hace borrado de tipos en el compilador, tiene generics, pero solo en tiempo de ejecución, el compilador castea de tal manera que la máquina de java no hace abstracción.
e.g. si uno hace en el código `List<Apple>` el compilador le agrega casteos para que cada vez que se usa esa lista entonces es de manzanas. 

>[!info] Sobrecarga de Operadores
>NO HAY SOBRECARGA DE OPERADORES, PORQUE DIJERON QUE ERA PORQUERIA DE C



