---
Topic: Iterator
Date: 2023-10-05
Course: Paradigms
tags:
  - notes
  - paradigms
---
Desacoplar la estructura de datos del algoritmo que recorre la estructura de datos

Se pueden generar con [[Generadores]]

El iterator se define por las [[Meta Modelo OOP De JS]] en una de sus _Meta Propiedades_

Se genera a través de un efecto que es único que se llama Symbol.

Al Symbol ser único entonces: $t = Symbol('x') \land s = Symbol('x') \therefore t \neq s$ 
pero por esto es que asegura que a[s] = 666 no le cae encima a a[t] = 555
definida por la _Meta Propiedad_ de **Symbol.iterator** 
![[Pasted image 20231005192711.png]]
![[Pasted image 20231005192743.png]]

Un objeto es iterator si tiene un método next, que devuelve el valor y el done
![[Pasted image 20231005192948.png]]

```javascript
// module nats.js
// nats = 0,1,2,3,4,...

class Nats {
	constructor(init=0) {
		this.init = init;
	}
	[Symbol.iterator]() {
		let n = this.init;
		return {
			next: () => {return {value:n++, done: false}}
		}
	}
}

module.exports = {
	Nats
}
```

``` js
// cambiar
let natsAfter4 = new Nats(5);
for (const n of natsAfter4)
	if (n > 11) break;
	console.log("***", n);

// cambiar 
let natsAfter4 = new Nats(5);
let iter = natsAfter4[Symbol.iterator]();
let temp = iter.next();
while(temp.value <= 11 && !temp.done){
	console.log(temp);
	temp = iter.next();
}

// solucion profe
let natsAfter4 = new Nats(5);
let iter = natsAfter4[Symbol.iterator]();
let {value, done} = iter.next();
while (!done) {
	if (value > 11) break;
	console.log("===", value);
	({value, done}) = iter.next();
}


// solucion con for
let natsAfter4 = new Nats(5);
let iter = natsAfter4[Symbol.iterator]();
let {value, done} = iter.next();
for (;!done; ({value, done}) = iter.next()) {
	if (value > 11) break;
	console.log("===", value);
}
```


>[!important] ITERATOR $\neq$ ITARABLE
>Iterator: Patrón de diseño
>Iterable: objeto de un iterator


