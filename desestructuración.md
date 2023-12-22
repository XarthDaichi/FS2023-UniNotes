---
Topic: desestructuración
Date: 2023-10-23
Course: Paradigms
tags:
  - notes
  - flashcards
  - paradigms
cards-deck: paradigms
---
```first.pl
%first(?L, ?F) si F es el primer elemento de la lista L
first([F | _], F).
```
Se utiliza [[Listas (Prolog)]]
También acordarse que el underscore es que va una variable pero no importa lo que vaya ahí

Acordar en las definiciones de funciones el + de la variables es input el - es output, el ? es los dos

```mermaid
graph TD
1(("first([1,2,3], F)"))

1
```


$[1,2,3]$         $\cong$        $[F|\_]$ 
```mermaid
graph TD
1((.))
2((1))
3((.))
4((2))
5((.))
6((3))
7((nil))

8((.))
9((F))
10((_))

1 --- 2
1 --- 3
3 --- 4
3 --- 5
5 --- 6
5 --- 7

8 --- 9
8 --- 10
```

```first.pl

% rest(L, R) para sacar el resto de la lista
rest([_|R], R).

% second([_ | [S | _]], S).
second([_, S | _], S).


```
