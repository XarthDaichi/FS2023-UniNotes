---
Topic: Monkey Patching
Date: 2023-09-11
Course: Paradigms
tags:
  - notes
  - paradigms
---
NO ES UNA BUENA PRACTICA

pero dejar cosas en global para o caerles encima o utilizarlas

e.g.
```node
var obj = {
 x: 0
 foo : function() {this.x++}
}

var obj2 = { x:0 }

// si se quiere meter una foo con la misma logica con el foo de obj, en obj2 se puede hacer
obj2.foo = obj.foo // ESTO ES MONKEY PATCHING
```

MANERA CORRECTA
```node
var obj = {
x : 0
foo : function() {this.x++}
}

> obj2 = {x : 0}
{x : 0}
> obj2.foo.call(obj2)

> obj2
{x : 1}
```
