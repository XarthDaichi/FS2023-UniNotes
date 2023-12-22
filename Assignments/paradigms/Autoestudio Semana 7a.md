---
type: homework
date: 2023-09-14
turned-in: false
status: Not Started
tags: homework
---
#  Autoestudio Semana 7a
1. Revise, repase y profundice:
	1. Combinadores call, apply, bind
	2. Resolución de "binding" (RB)
	3. RB dinámico versus RB estático
	4. Asincronía versus sincronía
	5. Stack frame
	6. JS Event Loop

2. Considere la función foo
```js
function foo(n) {
	return n <= 1 ? n : foo(Math.floor(n / 2))
}
```
Asumiendo que n es entero: encuentre el O-grande del número de frames (foo_frames(n)) que ocupa foo(n) en pila.
Es decir, cuánto es ? en foo_frames(n) ~ O(?)

3. Considere el código abajo:
	__Nota:__
	Escribir en un objecto como {..., f : function() {...}, ...} en ES6 se puede escribir {..., f() {...}, ... en notación de método}
	```js
	const obj = {
		x: 'x in obj',
		local_obj: {
			x: 'x in local_obj',
			getA() {const local = function() {return this.x};
			return local()},
			getB() {const local = () => this.x; return local()},
			getC() {const local = ()
			=> this.x; return local.call(this)},
			getD() {return local = () => this.x;}
		},
		getX(){return this.x}
	} 
	console.log("*** Cases of 'this' binding to explain ****")
	console.log(`Case 1: obj.local_obj.getA() = '${obj.local_obj.getA()}'`)
	console.log(`Case 2: obj.local_obj.getB() = '${obj.local_obj.getB()}'`)
	console.log(`Case 3: obj.local_obj.getC() = '${obj.local_obj.getC()}'`)
	console.log(`Case 4: obj.local_obj.getD() = '${obj.local_obj.getD()}'`)
	console.log(`Case 5: obj.getX.bind(this).call(obj.local_obj) = '${obj.getX.bind(this).call(obj.local_obj)}'`)
	```
	Explique la salida y justificando el porqué de la misma, la que se obtiene en cada caso.
