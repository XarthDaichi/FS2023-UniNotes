---
Topic: Compiladores y javascript
Date: 2023-07-31
Course: Paradigms
tags: notes paradigms
---

```javascript
let x = 666
x // gives 666
const PI = 2
PI = 3.14 // gives semantic error (does not make sense with variable initializer)
LET y = 1 // gives syntaxis error (does not make sense to compiler)
```

```java
var y = 100; // var deja hacer variables tipo typescript, en el momento en el que la define se tiene que quedar de ese tipo, entonces y no puede despues ser ""
```

>[!example] Burradas de javascript
> 666 + [] => '666' (aaaa querías hacer una suma de toStrings)
> NaN === NaN => false (hay infinitos más grandes que otros)
> NaN != NaN => true
> undefined == null => true (null es un valor que le quiso dar, undefined es un var masivo)
> Por qué ocurre: para que el browser no caiga, porque a la gente al estar browsing no le importa un pantallazo azul


Cosas de NaN
![[Pasted image 20230911185704.png]]
Esto ocurre porque NaN (not a number) no es un número por definición, pero tampoco se puede garantizar que es igual que otros NaN, por como sirven los flotantes