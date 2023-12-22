---
Topic: Quiz 1 Paradigmas
Date: 2023-08-31
Course: 
tags: notes
---
```java
class Food{}
class Fruit extends Food{}

<F extends Fruit> List<? super F> foo(List<? extends F> a) {...}

List<Fruit> a = new ArrayList<Fruit>();
a.add(new Fruit());
List<? super Food> b = foo(a);
b.add(new Food());
```

```javascript
let split = (a,f) => {
	[a.filter(e => f(e) === true), a.filter(e => f(e) === false)]
} // O(2n)


const empty = array => array.length = 0

let split = (a,f) => { 
	let res = [[],[]]
	a.forEach(e => f(e) ? res[0].push(e) : res[1].push(e))
	return res
} // O(n) mortiguado (porque el push a veces tiene mas que O(n) para pedir más espacio)
```
