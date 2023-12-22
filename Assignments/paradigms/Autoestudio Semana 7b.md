---
type: homework
date: 2023-09-18
turned-in: false
status: Not Started
tags: homework
---
#  Autoestudio Semana 7b
1. Revise, repase y extienda
	1. Arquitectura básica de JS (stack, queue, heap)
	2. Eventloop (y libuv)
	3. Timers
	4. I/O asincrónico con fs
	5. Callback hell
	6. Explicar gráficamente la salida de un código sincrónico vs asincrónico
__Nota:__ Como alguien me hizo ver algunos también mencionan el `Promise hell` para favorecer async/await. ¡Cierto!

2. Escriba un combinador `repeatUnitWhen({state, what, when, then, ms})` que de manera asincrónica (non-blocking) ejecute `what(state)` cada `ms` milisegundos hasta que `when(state)` sea verdadero. Al terminar se ejecuta `then(state)`. Por defecto, si no viene, then es la función identidad y `ms` es 1000 (Investigue ES6 `default parameters`) No use promesas ni async/await.
```js
// Test case
const state = {x:0}
const what = state => state.x += 1;
const when = state => {
	console.log(`When: current = x=${state.x}`); return state.x > 3;
}
const then = state => console.log(`Final x = ${state.x}`);
repeatUntilWhen( {state, when, when, then, ms:1000 } )
```
	Salida (cada segundo)
	When: current x=0
	When: current x=1
	When: current x=2
	When: current x=3
	When: current x=4
	Final x=4

3. Revise el demo explicado hoy. Añada tres keywords más(class, const, of) y recompile y pruebe que todo funciona. Añada un style TextArea.css que cambie un poco de css del componente TextArea (a su gusto)