---
type: homework
date: 2023-09-11
turned-in: false
status: Not Started
tags: homework
---
#  Autoestudio Semana 6b
0. Revise brevemente esas dos librerías que le mencioné en clases: lodash (es más que para FP) y unserscoreJS (sí es más para FP). La última fue hecha antes de ES6, entonces algunas coas ya está en el API de Array.

1. Revise el [API de Array](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array) en JS. Si llamamos "combinador" de arrays a cualquier método en ese API que reciba una función de parámetro (Nota: a una función de parámetro también se le dice una callback function, o callback simplemente).

	Esté en capacidad de implementar usando FP su propia versión de cada uno de esos combinadores. Nota: que no sean las que ya implementamos como filter y map. **Nota**: los callbacks de Array reciben hasta n + 2 parámetros x1,...,xn, i, thisArg, siendo x1, ..., xn los propios de callback, i es el índice del elemento que está siendo visto y thisArg el array (a menos que se cambie; lo cual veremos luego en clase)

	Por ejemplo
	```js
	let a = ['a', 'b', 'c']
	a.forEach(( e, i ) => console.log(`${e+i}$`))
	```
	Imprime
	a0)
	b1)
	c2)

2. Justifique en cada caso abajo, cuál identidad es válida y cuál no. En este último caso, dé un contraejemplo
	Sean f y g funciones cualesquiera tal que f o g existe y sea a un array cualquiera tal que los combinadores son aplicables a a.

	1. `a.map(f).map(g) = a.map(g).map(f)`
	2. `a.filter(f).map(g) = a.map(g).filter(f)`
	3. `a.map(f).map(g) = a.map(f o g)
	4. `a.filter(f).filter(g) = a.filter(g).filter(f)

3. Usando reduce, construya combinador zip que cumpla `zip(a, b, f = [ f(a[i], b[i]) / i = 0,... , n-1 ]` para cualesquiera array a y b tales que n = a.length = b.length. Razone sobre el tiempo de corrida y consumo de memoria

4. Implemente en FP reverse(a) que dado un array a retorna un array b tal que b\[i\] = a\[n-i-1\] para i = 0, ... n-1 donde n = a.length

5. Sea `add_curry = x => y => x + y`
	Sea `foo = x => add_curry(X) (x)`
	Dado lo que hace foo, qué nombre es más apropiado en vez de foo. Justifique su respuesta.

6. Diga qué hace la función foo siguiente y póngale un nombre acorde a su propósito.
	`const foo = n => Array.from(new Array(n), (_, i) => i)`
