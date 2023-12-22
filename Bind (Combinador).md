---
Topic: Bind (Combinador)
Date: 2023-09-11
Course: Paradigms
tags:
  - notes
  - paradigms
---
Sirve para sacar el this de un objeto a global
```node

var x = 0

var obj = {
x : 0,
foo : function() { this.x++}
}

var obj_foo = obj.foo.bind(obj)

// ahora si se llama obj_foo entonces va a modificar el x de obj no el x global
```
