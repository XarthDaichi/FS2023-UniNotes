---
type: homework
date: 2023-11-06
turned-in: false
status: Not Started
tags: homework
---
#  Autoestudio Semana 14b
1. Revise, repase, amplie
	- Análisis Sintáctico o Parsing
	- Gramática Libre de Contexto (CFG)
	- Terminal, noterminal
	- Expresión Regular (RE o Regex) (Nota: Prolog tiene soporte para RE (Ver library(pcre)))
	- Token (tokenizer). (Averigüe cuánto cobra por token el API de ChatGPT de OpenAI)
2. SI `G` es una gramática denotamos `L(G)` el **lenguaje generado** por G al conjunto de palabras que el lenguaje produce con sus reglas.
	Resuelva:
	Si `G1` es:
	```
	S -> A "b"
	A -> epsilon
	A -> "a"
	```
	Y `G2` es:
	`S -> "a"* "b"`

	Justifique o refute la afirmación `L(G1) = L(G2)`
	
	Respuesta: No son iguales dado a que en uno el lenguaje está definido por `A"b" = ["a"|epsilon]"b"` o en regex `"a"?"b`, que a pesar de que está incluido en `"a"*"b"` no es lo mismo.
	
3. Considere las hileras que son palíndromes binarios (de ceros y unos).
	Ejemplo "0110", "00", "" (epsilon) son palíndromes binarios
	1. Escriba una gramática `G` tal que `L(G)` contiene exactamente esas hileras
	Respuesta:
	```
	S -> "0" S "0"
	S -> "1" S "1"
	S -> "0" | "1"
	s -> epsilon
	```

	2. Traduzca su solución anterior a Prolog
	Ejemplos de uso:
	```
	?- bin_palind([0,1,1,0], O).
	O = [].
	```
	```
	
	```

	3. Considere y estudie el siguiente código en Prolog que representa una gramática
		Asuma que todo empieza con foo
	```
	foo(['(' | I], O) :- goo(I, [')' | O]).
	goo([C | I], O) :- member(C, [a, b]), goo(I, O).
	goo(['(' | I], O) :- foo(['(' | I], O1), goo(O1, O).
	goo(I, I).
	```
	Describa cuál lenguaje genera la gramática asociada. Dé ejemplos y pruébelos en Prolog.

	Para probar `foo` usando un string en vez de una lista  añada el código abajo a su script y llama a `test_foo` con una hilera
	Por ejemplo:
	```
	?- test_foo("( a b )").
	>>> Parsing: "( a b )"
	*** "( a b )" --> Accepted! ***
	true.

	:- use_moduel(library(pcre)).

	weakly_split_string(String, Tokens) ;-
		re_replace("[\s\n]+"/ga, " ", String, AtomNoBlanksNorNewlines),
		re_split(".", AtomNoBlanksNorNewlines, AtomParts), 
		atomic_list_concat(AtomParts, ' ', Atom),
		atomic_list_concat(Parts, ' ', Atom),
		delete(Parts, '', Tokens)
	.
	test_foo(String) :-
		format('>>> Parsing: "~a"~n', [String]),
		weakly_split_string(String, TokensList),
		(foo(TokensList, [])
		 -> format('*** "~a" --> Accepted! *** ~n', [String])
		 ;  format('*** "~a" --> Rejected! *** ~n', [String])
		)
	.
	
	```