---
Topic: Filter
Date: 2023-09-07
Course: Paradigms
tags:
  - notes
  - paradigms
---
Un caso del [[Reduce (Fold)]] que reduce a otra lista, por lo cual se separo en su propio patrón

```javascript
const filter = (a,p) => a.reduce( (z,e) => p(e) ? z.concat(e) : z ,[])
```

![[Push vs Concat (JS)]]

Para usar push en el filter hay que usar el [[Operador Coma]]
```javascript
const filter = (a,p) => a.reduce( (z,e) => p(e) ? (z.push(e), z) : z ,[])
```

Concat, termina siendo más fácil de entender, pero utiliza más memoria ($O(n^2)$)

Push, es menos fácil de entender, pero utiliza menos memoria ([[O(n) amortizado]])