---
type: evaluation
date: 2023-10-16
status: Test
tags:
  - evaluation
  - flashcards
---
# Examen 1 Paradigmas
![[EIF400_II_2023_InventarioEjercicios_CLoria.pdf]]

- [x] [[Autoestudio Semana 1]] ✅ 2023-10-12
- [ ] [[Autoestudio Semana 2a]]
- [ ] [[Autoestudio Semana 2b]]
- [ ] [[Autoestudio Semana 4a]]
- [x] [[Autoestudio Semana 4b]] ✅ 2023-10-12
- [ ] [[Autoestudio Semana 5a]]
- [x] [[Autoestudio Semana 5b]] ✅ 2023-10-12
- [ ] [[Autoestudio Semana 6a]]
- [ ] [[Autoestudio Semana 6b]]
- [ ] [[Autoestudio Semana 7a]]
- [ ] [[Autoestudio Semana 7b]]
- [ ] [[Autoestudio Semana 8a]]
- [ ] [[Autoestudio Semana 9a]]
- [ ] [[Autoestudio Semana 10a]]
- [ ] [[Autoestudio Semana 10b]]
- [ ] [[Autoestudio Semana 11a]]

# Practica en Clase
![[EIF400_II_2023_Practica_AutoEstudio_CLoria.pdf]]
## Pregunta 1


```js
// a
function reduce(a, f, s) {

    // a:[T] f:(R, T) => R s:R

    let value = s;

    for (const e of a) {

        // value += f(value, e); // mi solucion original

        value = f(value, e); // solucion que tiene que ser

    }

    return value;

}

  

// b

// mi solucion

function map(a, f) { // NO DEBERIA OCURRIR

    for (let e of a) {

        e = f(e); // NO DEBERIA MODIFICAR a PORQUE A ES "INMUTABLE"

    }

    return a

}

  

// solucion optima

function map(a, f) {

    const arr = [];

    for (const e of a) {

        arr.push( f(e) );

    }

    return arr;

}

  

// otra solucion optima

function map(a, f) {

    let arr = [];

    for (const e of a) {

        arr = [...arr, f(e)];

    }

    return arr;

}

  

// tercera solucion optima

function map(a, f) {

    let arr = [];

    for (const e of a) {

        arr = arr.const( f(e) );

    }

    return arr;

}

  

// c

const every = (a, f) => { // solucion mia

    a.filter(e => f(e)).length === a.length;

}

  

const every = (a, f) => a.filter( f ).length === a.length; // solucion optima (no crear la lambda)

  

// otras soluciones

const every = (a, f) => a.reduce(( r, e ) => r && f( e ), true);

  

const every = (a, f) => a.reduce( (r, e) => f( e ) ? r : false, true);
```

## Pregunta 2
```js
// const overrides = (obj, p, C) => obj.hasOwnProperty(p) && C.prototype.hasOwnProperty(p)

function* constructors(original_class) {
	let construct = original_class
	while (construct.prototype !== Function.prototype) {
		yield construct
		construct = construct.constructor
	}
}

// obj instancia, property, class
const overrides = (obj, p, C) => C.prototype === Function.prototype ? obj.hasOwnProperty(p) && C.prototype.hasOwnProperty(p) : (obj.hasOwnProperty(p) && C.prototype.hasOwnProperty(p)) || overrides(obj, p, C.constructor)

class C {
    x() {return 666}
}

  

obj = new C()

console.log(overrides(obj, 'x', C)) // Should be false

  

obj.x = 10

console.log(overrides(obj, 'x', C)) // Should be true
```
- [x] Que overrides verifique si esta sobrescribiendo alguna propiedad de su linea de herencia ✅ 2023-10-16
## Pregunta 3
```js
const avg_promise = async ap => { 
	return ap.reduce(async (z, e) => { 
		const temp_z = await z;
		const temp_e = await e;
		return temp_z + temp_e;
	}, Promise.resolve(0)).then((data) => Promise.resolve(ap.length).then((den) => data / den));
}  
  
const avg_promisesss = ap => {
	return ap.reduce((z, e) => e.then((data) => z.then((data_z) => data_z + data)), Promise.resolve(0)).then((data) => Promise.resolve(ap.length).then((denominator) => data / denominator));
}

// utilizar Promise.all()
const avg_promisesss = ap => Promise.all(ap).then((data) => data.reduce((z,e) => z + e, 0)).then((result) => Promise.resolve(ap.length).then((denominator) => console.log(`${result / denominator}`)))

const ap = [10, 20, 30].map( n => Promise.resolve(n) )

await avg_promise(ap) // expected outputs 20
```
No sé como hacerlo sin await en avg_promise(ap),al menos de que se quiera hacer console.log
