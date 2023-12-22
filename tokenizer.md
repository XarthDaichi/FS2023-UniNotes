---
Topic: tokenizer
Date: 2023-11-06
Course: Paradigms
tags:
  - notes
  - flashcards
  - paradigms
cards-deck: paradigms
---
![[tokenizer 2023-11-06 18.05.01.excalidraw]]


Tokenizer termina siendo un tipo de [[Parser]]

```ofs
//test
const f = [* 0, n -> n + 1]
```
![[tokenizer 2023-11-06 18.08.35.excalidraw]]
![[tokenizer 2023-11-06 18.22.26.excalidraw]]

![[tokenizer 2023-11-06 18.29.25.excalidraw]]
```Prolog
/*
s -> aes "b"
aes -> epsilon
aes -> "a" aes
*/

% L(G) = {palabras que G podria generar}
% s(I, O) true si I es una lista de tokens en el L(G), sobrando O

s(I, O) :- aes(I, SinAes), SinAes = [b | O].
aes(I, I).
% aes(I, O) :- I = [a | RI], aes(RI, O).
aes([a | RI], O) :- aes(RI, O). % levemente optimizado
```
```swipl
1 ?- [testing].
true.

2 ?- s([b], O).
O = [] .

3 ?- s([b,c], O).
O = [c] ;
false.

4 ?- s([b,c], []), !.
false.

5 ?- s([a,b], []), !.
true.

6 ?- s([a,a,b], []), !.
true.

7 ?- s(I, []).
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
