---
Topic: Modules (Javascript)
Date: 2023-09-04
Course: Paradigms
tags:
  - notes
  - paradigms
---
Cosas importantes:
- Import
- Export


```javascript
// CJS
const comp = (f,g) => x => g(f(x)) // no Wikipedia
const id = x => x

const comp_multiple = a => {
	if (a.length === 0) return id // Regla 1
	const [f, ... rest] = a
	if (rest.length === 0) return f // Regla 2
	return comp(f,comp_multiple(rest)) // Regla 3
}

module.exports = {
	comp, // vale igual que hacer "comp : comp"
	comp_multiple,
	id
}
```

Ejemplo de aclaración del código anterior, solo de EPS6 para arriba
```node
> let x = 666
undefined
> let y = 555
undefined
> let obj = {x:x, y:y}
undefined
> let obj2 = {x,y}
undefined
> obj
{ x: 666, y: 555 }
> obj2
{ x: 666, y: 555 }
```

```javascript
// otro documento
let {comp} = requre('./Comp.js')
comp(x => x + 2, x => x * 2)(10)
```

```Javascript
// otro documento
let {id} = require('./Comp.js')
let x = id;

id : {666}
```

Para importar un módulo entero
```javascript
const m = require('./Comp.js')
// importas el modulo entero pero en vez se llamarlo como comp, lo llamas como m.comp (encapsulacion)
```
