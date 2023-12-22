---
type: homework
date: 2023-08-28
turned-in: false
status: Started
tags: homework
---
#  Autoestudio Semana 4b
## Pregunta 1
### Revise, repase y extienda los siguiente conceptos
- Valor
- Tipo
- Sistema de Tipos ([[Typer]]) como sistema formal de razonamiento
- Reference type vs Primitive type ([[Type]])
- Operaciones y relaciones sobre y entre tipos (<: y :) y sus propiedades de reflexividad y transitividad
- Generics y varianza (in-, co- y contra-) y casos de uso en Java
- Narrowing de tipos (no lo hemos visto a las 6pm aún)

## Pregunta 2
Explique por qué int x = null; no compila pero Integer y = null; sí (equivale a preguntarse de qué lado de las dos castas está null)
Esto se da porque int es un tipo primitivo y null termina siendo de referencia al menos en Java. por lo tanto no se puede caster un referencia a null, pero sí se puede castear un tipo de referencia (Integer) a null;

## Pregunta 3
Queremos un modelo de datos de una clase de objeto Point que modela un par (x, y) donde x,y pueden ser de cualesquiera tipos que sean comparables (en el sentido de Comparable de Java). Les diremos a x,y las coordenadas. 
Un Point a la vez es comparable. 
Dos Points (x1, y1) y (x2, y2) son "equal" si lo son entrada a entrada
Para determinar si un Point (x1, y1) es "menor" que el otro Point (x2, y2) se comparan <u>lexicográficamente</u>: si x1 es "menor" que x2 se cumple (independientemente de los y), si x1 es "mayor" que x2 ya no se cumple  del todo. Si x1 es equal a x2 se comparan los y para decidir (y1 debe ser "menor" o equal que y2). Podrían haber especializaciones de Point, por ejemplo PointInteger o PointString (en ambos casos las coordenadas siendo del mismo tipo, y todo lo que funcionaba bien)

## Pregunta 4
Explique paso a paso si el siguiente código compilaría en cada caso, por qué sí o no, y las diferencias entre copyA hasta copyG sobre qué tipo de varianza se está usando.
Note que en un caso se usa un **método parametrizado** (que no hemos visto, pero son similares a tipos como class\<T>{}), el(los) tipo(s) que se declara(n) justo antes del tipo de retorno.
En los casos que sí compile, cree para ese caso listas ejemplos de a y b (no nulas ni vacías) tales que el llamado a copyX(a,b) sí compila donde x es A, B, hasta G y copyX si compila.

```java
void copyA(List<Integer> a, List<Integer> b) {
	for (var e : a)
		b.add(e);
}
```


```java
void copyB(List<Integer> a, List<? extends Integer> b) {
	for (var e : a)
		b.add(e);
}
```

```java
void copyC(List<Integer> a, List<? super Integer> b) {
	for (var e : a)
		b.add(e);
}
```

```java
void copyD(List<? super Integer> a, List<Integer> b) {
	for (var e : a) 
		b.add(e);
}
```

```java
void copyE(List<? super Integer> a, List<? super Integer> b) {
	for (var e : a)
		b.add(e);
}
```

```java
void copyF(List<? extends Integer> a, List<? super Integer> b) {
	for (var e : a)
		b.add(e)
}
```

```java
<T> void copyG(List<T> a, List<T> b) {
	for (var e : a)
		b.add(e);
}
```

## Pregunta 5
Pida a ChatGPT una lista de 15 digamos 'pifias' (comportamientos peculiares) de JS en cuanto al menejo de tipos (conversiones implícitas).
Por ejemplo:
¿Qué retorna 666 + \[]?
¿O cuánto es NaN == NaN?
Fórmese una opinión "educada" sobre JS (recuerde está entre los 3-5, más usado del mundo :-)).

Prompt: show 15 wierd things about javascript

```
Certainly! JavaScript is a versatile and sometimes quirky programming language. Here are 15 weird things about JavaScript:

1. **Automatic Semicolon Insertion (ASI)**: JavaScript has a feature that automatically inserts semicolons in certain cases where they are missing. This can lead to unexpected behavior if you're not careful with your code formatting.
    
2. **NaN**: JavaScript's "Not-a-Number" value is quite peculiar. Even though it represents an undefined or unrepresentable value, it's still considered a number: `typeof NaN` returns `"number"`.
    
3. **Type Coercion**: JavaScript tries to convert data types in certain operations, which can lead to surprising results. For example, `[] == ![]` evaluates to `true`.
    
4. **Truthy and Falsy Values**: JavaScript treats some values as truthy (considered true in a boolean context) and some as falsy (considered false). Empty arrays, empty strings, `0`, and `null` are all falsy values.
    
5. **Global Object**: If you're not in strict mode, variables declared without the `var`, `let`, or `const` keyword become global variables, attached to the global object (usually `window` in browsers).
    
6. **Hoisting**: Variable and function declarations are hoisted to the top of their containing scope during compilation. This means you can use them before they're actually declared in the code.
    
7. **Closure Loop**: If you create functions in a loop that reference loop variables, they will all capture the same value because closures capture variables, not values.
    
8. **"this" Context**: The value of the `this` keyword depends on how a function is called. It can be surprising, especially within nested functions and event handlers.
    
9. **Equality Operators**: JavaScript has two equality operators: `==` and `===`. The former performs type coercion, while the latter checks for both value and type equality. This can lead to unexpected results if not understood correctly.
    
10. **Prototype-based Inheritance**: JavaScript uses prototypal inheritance instead of classical inheritance like many other languages. This can make object-oriented programming in JavaScript a bit unconventional.
    
11. **Async Nature**: JavaScript is single-threaded and uses an event loop to manage asynchronous operations. This can lead to unexpected behaviors if you're not familiar with how asynchronous code works.
    
12. **Callback Hell**: In the early days of JavaScript, nested callbacks led to unreadable and hard-to-maintain code structures, often referred to as "callback hell."
    
13. **"NaN" !== "NaN"**: NaN values are not considered equal to each other. So, `NaN === NaN` evaluates to `false`.
    
14. **Unary Plus Operator**: You can use the unary plus operator to convert a string to a number. For example, `+"42"` returns the number `42`.
    
15. **Math Object Inconsistencies**: The `Math` object in JavaScript contains various mathematical functions, but some of them can behave unexpectedly due to rounding errors and precision limitations.
    

These weird aspects of JavaScript can sometimes make programming in the language challenging, but they also contribute to its unique character and the need for developers to be aware of its intricacies.
```


Sure, implicit type conversion in JavaScript can sometimes lead to unexpected and weird behavior. Here are 15 examples of such cases:

**String Concatenation with Numbers**:
`console.log("5" + 1); // Outputs "51"`
    
**Adding Array and Number**:
`console.log([1, 2] + 3); // Outputs "1,23"`

**Subtraction with Non-Numeric Strings**:
`console.log("hello" - "world"); // Outputs NaN`
    
**Truthy and Falsy Concatenation**:
`console.log("hello" + false); // Outputs "hellofalse"`
    
**Adding Object and Number**:
`console.log({} + 42); // Outputs "[object Object]42"`
    
**Adding Object and String**:
`console.log({} + "abc"); // Outputs "[object Object]abc"`
    
**Subtraction with Booleans**:
`console.log(true - false); // Outputs 1`
    
**Division with Strings**:
`console.log("10" / 2); // Outputs 5`
    
**Truthy and Falsy Coercion in Logical Operations**:
`console.log(false || "hello"); // Outputs "hello"`
    
**Multiplication with Booleans**:
`console.log(true * 2); // Outputs 2`

**Adding Null and Undefined**:
`console.log(null + undefined); // Outputs NaN`

**Subtraction with Undefined**:
`console.log(5 - undefined); // Outputs NaN`

**Multiplication with Null**:
`console.log(null * 5); // Outputs 0`

**Division by Infinity**:
`console.log(1 / 0); // Outputs Infinity`

**Adding Infinity and Negative Infinity**:
`console.log(Infinity + (-Infinity)); // Outputs NaN`

These examples showcase the peculiarities of type conversion in JavaScript, which can sometimes lead to unintuitive and unexpected results. It's important for developers to be aware of these behaviors to avoid bugs and ensure their code works as intended.