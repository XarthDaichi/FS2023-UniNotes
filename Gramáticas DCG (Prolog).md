---
Topic: DCG
Date: 2023-11-06
Course: Paradigms
tags:
  - notes
  - flashcards
  - paradigms
cards-deck: paradigms
---
```Prolog
/*
s -> aes "b"
aes -> epsilon
aes -> "a" aes
*/

s --> aes, [b].
aes --> [].
aes --> [a], aes.
```
```swipl
1 ?- [testing].
true.

2 ?- listing(s).
s(A,B) :-
	aes(A,C),
	C=[b|B].

true.

3 ?- listing(aes).
aes(A, B) :-
	A = B.
aes([a|A], B) :-
	aes(A,B).

4 ?- s([a,b], []), !.
true.

5 ?- s([a,a,b], []), !.
true.

6 ?- s(I, []).
I = [b] ;
I = [a,b] ;
I = [a,a,b] ;
I = [a,a,a,b] ;
I = [a,a,a,a,b] ;
I = [a,a,a,a,a,b] ;
I = [a,a,a,a,a,a,b] ;
I = [a,a,a,a,a,a,a,b] ;
I = [a,a,a,a,a,a,a,a,b] ;
I = [a,a,a,a,a,a,a,a,a[...]] .

```

```Prolog
%entero(I, O) : true si las tokens de I son digitos decimales y sobra O.

is_decimal_digit(D) :- member(D, [0,1,2,3,4,5,6,7,8,9]).

entero --> [D], {is_decimal_digit(D)}, rest_entero.
rest_entero --> [].
rest_entero --> [D], {is_decimal_digit(D)}, rest_entero.
```

```Prolog
is_decimal_digit(D) :- member(D, [0,1,2,3,4,5,6,7,8,9]).
is_operator(Operator) :- member(Operator, ['+', '-')

entero --> [Operator | D], {is_operator(Operator)}, {is_decimal_digit(D)}, rest_entero.
entero --> [D], {is_decimal_digit(D)}, rest_entero.
rest_entero --> [].
rest_entero --> [D], {is_decimal_digit(D)}, rest_entero.
```

EJEMPLOS DE COMPILAR DCG::
```Prolog (DCG)
l --> a,[x],b.
l(A,B) :- a(A,A1), A1 = [x | A2], b(A2,A3), B = A3.
```

```Prolog(DCG)
l-->[x,y], a.
l(A,B) :- A = [x,y | A1], a(A1,A2), B = A2.
```

```Prolog(DCG)
l-->[].
l(A,B) :- A = B.
% tambien sirve:
l(A,A).
```


>[!info] Strings vs atoms in DCG
>Besides them being almost the same in Prolog
>DCG has an additional functionalities for them
>
>Las comillas del string deja saber cuales son 
>Strings:
>![[Pasted image 20231109184646.png]]
>![[Pasted image 20231109184703.png]]
>
>Atoms:
>![[Pasted image 20231109184720.png]]
>![[Pasted image 20231109184728.png]]







