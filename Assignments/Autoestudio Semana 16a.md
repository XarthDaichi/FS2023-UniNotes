---
type: homework
date: 2023-11-16
turned-in: false
status: Not Started
tags: homework
---
#  Autoestudio Semana 16a
Estos ejercicios le pueden ayudar con el proyecto y con el II Parcial. En especial el 2)  
1) Revise, Aumente, Investigue  
Los siguientes (meta)predicados le pueden resultar muy útiles (algunos ya los hemos usado)  

- delete: para borrar elementos de una lista
- phrase (similares como phrase_from_file): para llamar gramáticas DCG
- call: el equivalente de call de FP
- ! (cut): es un true que corta el backtracking horizontal y vertical
- apply: el equivalente de apply de FP
- include y exclude: son equivalentes de filter de FP (include deja pasar, exclude no deja pasar)
- maplist: el equivalente de map de FP
- foldl: el equivalente de reduce de FP
- forall: el equivalente de foreach de FP
- once: es como un call una vez: que falla o da true sin dar backtracking
- findall: es como un select de SQL
- fail:  provoca backtracking por false (es lo mismo que false) 
- -> ; :   es el ternario de Prolog 

2) Ud. recibe una lista de términos Prolog, que pueden incluir el átomo null (cero o más veces)  
Escriba eliminate_null(+L, -M)  donde L es una lista de términos y M es L quitando todos los null  en L respetando el orden  
Ejemplo:  
?- eliminate_null([a, null, b, [c], null], M).  
M = [a, b, [c]]  
Haga tres versiones a) Usando recursión b) Usando metapredicados c) usando delete/3  
  
3) Considere esta CFG (note que estamos usando estilo RE):  
expr -> arrow_expr  
arrow_expr -> pipe_expr ("->" expr)*  
pipe_expr -> simple_expr (">>" expr)*  
simple_expr -> monom (("+"|"-")? monom)*  
monom -> factor (("*"|"/")? factor)*  
factor -> call | literal | "(" expr ")" | "-" expr | expr_list  
call -> ident ("(" expr_sequence? ")")?  
expr_list -> "[" expr_sequence? "]"  
expr_sequence -> expr ("," expr)*  
ident -> [a-zA-Z_$][a-zA-Z0-9_$]*  
literal -> number | boolean | "null" | "undefined"  
number -> [+-]?[0-9][0-9]*  
boolean -> "true" | "false"  
   
a) Reescriba usando DCG  
  
b)  Incorpore en OFS 2.0. 

  

c) Añada operaciones lógico y relacionales (&&, ||, !=, \=\=, ! >)  
  
d) Modifique para incorporar los combinadores de OFS  
  
e) ¿Qué habría que hacer para tener hileras (string)?