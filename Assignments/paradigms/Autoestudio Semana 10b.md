---
type: homework
date: 2023-10-09
turned-in: false
status: Done
tags:
  - homework
---
#  Autoestudio Semana 10b
1. Repase, revise y extienda:
	1. ES6 class versus ES5 function (constructor)
	2. Patrón iterable y sus beneficios
	3. Definición de Iterable e Iterator en ES6
	4. Estructuras y algoritmos Lazy versus Eager
	5. Symbol y su objetivo
	6. Symbol.iterator

2. Verifique todo string en JS es [[iterable]]
![[Pasted image 20231119212019.png]]
![[Pasted image 20231119212200.png]]
![[Pasted image 20231119212104.png]]
![[Pasted image 20231119212118.png]]
![[Pasted image 20231119212142.png]]
![[Pasted image 20231119212126.png]]

3. Modifique el Nats hecho hoy para que aparte del natural inicial (init), reciba, opciónalmente, un maximo (max) y un incremento (increment). Por ejemplo lo siguiente abajo debería funcionar (note que el for "por dentro automáticamente llama al iterador y hace que n sea el obj.value del objeto obj retornado por el iterador que este retorna y se detiene cuando obj.done == true. Similarmente con spread"). No use (aún) generadores que no hemos visto:

```node
> for ( const n of new Nats(5, 10, 2) ) console.log(n);
5
7
9
> a = [...Nats(5, 10, 2) ]
> console.log(a)
> [ 5, 7, 9 ]
```
Sería como un range de python

```javascript
class Nats {
	constructor(init=0, max=Infinity, increment=1) {
		this.init = init - increment;
		this.max = max;
		this.increment = increment;
	}
	[Symbol.iterator]() {
		let n = this.init;
		return {
			next: () => {return {value:n+=this.increment, done:n>this.max}}
		}
	}
}
```

4. Construya Digits tal que algo como lo siguiente funcione (no use aún generadores para practicar)
```node
> const digits = new Digits(66601)
> for (const d of digits) console.log(d)
6
6
6
0
1
```

```javascript
class Digits {
	constructor(number=0) {
		this.number = number;
		this.digitCount = Math.max(Math.floor(Math.log10(Math.abs(number))), 0) + 1;
	}
	[Symbol.iterator]() {
		let digit = this.digitCount;
		return {
			next: () => {return {value:Math.floor((this.number / Math.pow(10, digit-- - 1)) % 10), done:digit<0}}
		}
	}
}
```

5. OFS P1.5 ("fake compile")