---
type: homework
date: 2023-11-09
turned-in: false
status: Not Started
tags: homework
---
#  Autoestudio Semana 15a
1. Revise, repase, amplie
	- DCG: definit clause grammar
	- atomic_list_concat/2
	- atom_number/2
	- atom_codes/2
	- atom_chars/2
2. Modifique la DCG de entero para que haya también flotante para manejar números decimales eventualmente signados con parte entera y parte decimal. Es decir la tokenización de hilaras como '123.45', '-678.0', '+666', '0.25' (note que todo entero es flotante).
3. Escriba una DCG que genere "*llamados a funciones con argumentos binarios*".

	% `function_call(I, O): true` si `I` es la tokenización de una llamada a una funcion, sobrando `O`.
	Ejemplos:
	```
	?- Tokens = [f, '(', 0, ',', g, '(', 0, ')', ',', 1, ')'], % representa la tokenización de 'f(0, g(0), 1)'
	function_call(Tokens, []).
	true.

	?- Tokens = [h, '(', h, '(', '0', ',', g, '(', '1', ')', ')', ')'], % representa la tokenización de  'h(h(0,g(1)))'  
   function_call(Tokens, []).  
	true.  
  
	?- Tokens = ['g', '(', ')'], % representa la tokenización de  'h())'  
	function_call(Tokens, []).  
	true.
	```
Los paréntesis siempre están bien cerrados. Los argumentos van separados por coma. Asuma por simpleza que la funciones son solo f, g y h y que 0 o 1 los valores de argumentos que no son llamados anidados.

4. Usando 3 extienda la DCG para que recupere la expresión original en un AST de Prolog.
	Ejemplo:
	```
	?- Tokens = [f, '(', 0, ',', g, '(', 0, ')', ',', 1, ')'], 
	function_call_ast(Ast, Tokens, []).
	Ast = f(0,g(0),1) % **OJO**: no es un átomo es un árbol
	```
	