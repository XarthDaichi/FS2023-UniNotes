---
Topic: Reduce (Fold)
Date: 2023-09-07
Course: Paradigms
tags:
  - notes
  - paradigms
---
![[Drawing 2023-09-07 18.26.53.excalidraw]]


Reduce, grab a collection and output a single thing you reduces a collection, through a specific thing![[Drawing 2023-09-07 18.43.03.excalidraw]]
```javascript
// misc.js
const avg = a => a.reduce( ( z , e ) => z + e , 0 ) / a.length 
// pulga si a.length === 0
// si utilizo el la sumatoria varias veces a.reduce( (z , e ) => z + e , 0 ), se pone por afuera

// comp( s => s / a.length, a.reduce( ( z , e ) => z + e , 0) )

module.exports = {
	avg
}

```
 ```javascript 
 // misc_client.js
const {avg} = require('./misc.js')

let a = [10, 5, 8, -2]

console.log(`avg([${a}])=${avg(a)} ==? {5.25}`)
```

