---
type: homework
date: 2023-11-13
turned-in: false
status: Not Started
tags: homework
---
#  Autoestudio Semana 15b
0. Estudie sobre
	- [read_file_to_codes/3](https://www.swi-prolog.org/pldoc/doc_for?object=read_file_to_codes/3) (para leer un file a una lista de codes)
	- [code_type/2](https://www.swi-prolog.org/pldoc/doc_for?object=code_type/2) predicado muy útil para saber tipos de códigos (alfabético, espacio, etc)
	- [Utiliería](https://eu.swi-prolog.org/pldoc/man?section=basics) para facilitar tareas comunes de parsing en dcg
	- Librería para [RE](https://www.swi-prolog.org/pldoc/doc_for?object=section(%27packages/pcre.html%27)) (expresiones regulares) en Prolog.
	- Esos links le puede ayudar en los ejercicios que se le plantean a continuación. Pero no son estrictamente necesario para resolverlos.
1. Se adjuntan las versiones del (seudo) parser de OFS que estuvimos trabajando en clase. Al haber permitido que `semicolon` sea un `statement` eso creaba un ciclo en infinito en ciertos, casos, lo cual corregí. Le adjunto la versión corregida. Pero Ud. debe descubrir cuál era la "pulga" (bug) que provocaba el problema.
2. Añada a su parser que acepte identificadores y números (ahora solo acepta "x" y "1"("666" versión 1pm ;-))
3. Añada a su parser OFS el que una expresión (expr) pueda ser una lista estilo JS.
	Por ejemplo, debe aceptar:
	`const una_lista_anidad = [[1], -2, [], [[[+3,4]]], 5, [x,y]]`
4. Añada comentario de una línea como `// un comentario.` (lo termina siempre un cambio de línea). El comentario por ahora se ignora del todo. Sugerencia: Trate el comentario como si fuera una especia de `space`.
5. Pensando en OFS 2.0: planeé desde ya el nuevo branch que incorporará su parser de OFS a la app.