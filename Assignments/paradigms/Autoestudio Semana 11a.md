---
type: homework
date: 2023-10-12
turned-in: false
status: Done
tags:
  - homework
---
#  Autoestudio Semana 11a
1. Revise, repase, amplie:
	1. Iterable vs Iterator vs Generator
	2. Explique la frase "un generator es un iteratos sobre un código en vez de sobre una estructura de datos que es un iterable"

2. Usando el Nats hecho en clase, reescriba a) el siguiente código usando un for (pero sin usar un índice como i) y b) lo mismo pero usando un do while

```js
const nats5 = new Nats(5);
for (const n of nats5) {
	if (n > 11) break;
	console.log(n);
}
```
```js
const nats5 = new Nats(5);
for (let iter = nats5[Symbol.iterator](), n = iter.next(); n.value <= 11; n = iter.next()) console.log(n.value)
```
```js
// version mejor
const nats5 = new Nats(5);
let iter = nats5[Symbol.iterator]();
let {value, done} = iter.next();
for (; !done && value <= 11;) {
	console.log(value);
	{value, done} = iter.next();
}
```
```js
const nats5 = new Nats(5);
let iter = nats5[Symbol.iterator]();
let n;
do {
	n = iter.next();
	console.log(n.value);
} while (n.value < 11);
```
```js
// mejor version
const nats5 = new Nats(5);
let iter = nats5[Symbol.iterator]();
let {value, done} = iter.next();
do {
	console.log(value);
	{value, done} = iter.next();
} while (!done && value <= 11)
```

3. Rehaga los ejercicios de Iterables de Semana 10b pero usando generadores
```js
function * Nats(init=0, max=Infinity, increment=1) {
	let n = init;
	while (n < max) {
		yield n;
		n += increment;
	}
}

function * Digits(number) {
	let digitCount = Math.max(Math.floor(Math.log10(Math.abs(number))), 0) + 1;
	while (digitCount > 0) {
		yield Math.floor((number / Math.pow(10, digitCount-- - 1)) % 10);
	}
}
```
4. Para la clase Stream hecha en clase, escriba un método first ( p ) que encuentra el primer elemento en el Stream que cumpla el predicado p. Si lo encuentra, lo sigue retornado infinitamente (después vemos cómo "pararlo", pero si un generador evalúa un return entonces se termina la búsqueda, entonces puede probar esa opción). Si no lo encuentra el Stream sigue generando infinitamente.
```js
class Stream {
	#iterable;
	constructor( iterable ) {
		this.#iterable = iterable;
	}
	
	map( f ) {
		function* gen( iterable ) {
			for (const e of iterable) {
			yield f( e );
			}
		};
		return new Stream( gen(this.#iterable) );
	}

	filter( p ) {
		function* gen( iterable ) {
			for (const e of iterable) {
				if ( p( e ) ) yield e;
			}
		};
		return new Stream( gen(this.#iterable) );
	}

	toList() { // Caution: only for finite Streams!!!
		return [...this.#iterable];
	}

	first( p ) {
		function* gen( iterable ) {
			let n;
			for (const e of iterable) {
				if ( p( e ) ) {
					n = e;
					break;
				}
			}
			while (true) {
				yield n;
			}
		}
		return new Stream( gen(this.#iterable) );
	}

	getIterable() {
		return this.#iterable;
	}
}
```