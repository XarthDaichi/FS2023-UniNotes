---
type: homework
date: 2023-10-30
turned-in: false
status: Started
tags:
  - homework
---
#  Autoestudio Semana 13b
1. Revise, repase, investigue, extienda
	- De csv a Prolog
	- open, close, variantes de read
	- Recursion en Prolog
	- Diccionarios (ver abajo, se ocupa en ejercicios. Deben investigarlo)
2. Un diccionario en prolog es de la forma `tag(key_1:term_1, ..., key_n:term_n)` donde `tag` es atomo o variable, los `key_i` son átomos y los `term_i` son términos (AST) incluyendo diccionarios. El acceso es de la forma `d.key` donde `d` es un diccionario y `key` una llave en `d`. Hay otras formas de acceso (get) y operadores como ':<' y '>:<' Son como objetos en JS, excepto que tiene siempre un tag al inicio.
	Ejemplo
	`?- D = person{id:1, name:{first:juan, last:perez}, age:20, gender:male}.`
	`D = person{age:20, gender:male, id:1, name:{first:juan, last:perez}}.`
	Escriba `fullName(+P, -S)` que dado un diccionario `P` que cumple con el ejemplo anterior de `person` retorna en `S` un átomo que es el nombre completo de la forma last, first(lastname, comma, firstname)

  **Hint:** Puede ocupar `atomic_list_concat` y el operador de diccionarios :<
  Ejemplo de uso:
  ```prolog
?- P = person{id:1, name:name{first:juan, last:perez}, age:20, gender:male}, fullName(P, FN).  
P = person{age:20, gender:male, id:1, name:name{first:juan, last:perez}},  
FN = 'perez, juan'.
```

```prolog
p(person{id:1, name:name{first:juan, last:perez}, age:20, gender:male}).

  

% fullName(+P, -S)

fullName(P, S) :-

    is_dict(P),

    _{id:_, name:N, age:_, gender:_} :< P, !,

    is_dict(N),

    _{first:F, last:L} :< N, !,

    atomic_list_concat([L, ', ', F], S)

.
```

3. usando el demo `CSV_JSON` y modificado según la clase de hoy:
	Escriba `withSameAge(+LP, +A, -LSA)` que retorne la lista `LSA` de personas que tienen la misma edad `A`
	Haga dos versiones a) una recursiva otra b) usando findall.
```
%%%% VERSION A
withSameAge([], _, []).

withSameAge([P | R], A, LSA) :-

   withSameAge(R, A, LSAR),

   (P \= person(_, _, _, A)

      -> LSA = LSAR

      ; LSA = [P | LSAR]

   )

.

%%% VERSION B
withSameAge(LP, A, LSA) :-
   findall(person(I, N, G, A), member(person(I,N,G,A), LP), LSA).
```
- [x] TODO: fix this findall ✅ 2023-11-20
