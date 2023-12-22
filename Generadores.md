---
Topic: Generadores
Date: 2023-10-05
Course: Paradigms
tags:
  - notes
  - paradigms
---
Se puede hacer un [[Factorial]] en [[Programación Funcional]] con [[Iterator]], utilizando [[Generadores]] para no gastar O(n) en memoria

Es un _Iterable_ pero también un [[Iterator]]

```js
function* nats() { // un generador
	yield 0;
}

let gen = nats();

gen[Symbol.iterator];
gen.next();
```
Un generador: es un iterator que no camina sobre una estructura de datos, sino por código