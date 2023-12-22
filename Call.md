---
Topic: Call
Date: 2023-09-11
Course: Paradigms
tags:
  - notes
  - paradigms
---
En javascript como el this se puede cambiar para que sirvan las llamadas, entonces se puede llamar algo con el this de otro objeto.
```node
var obj = {
x : 0
foo : function() {this.x++}
}

> var obj2 = {x : 0}
{x : 0}
> obj.foo.call(obj2)

> obj2
{x : 1}
