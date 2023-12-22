---
type: homework
date: 2023-08-10
turned-in: false
status: Not Started
tags: homework paradigms
---
#  Autoestudio Semana 2a

1. Repase, revise enriquezca estos conceptos mencionados en clase
	- Expresión versus estatuto. Reflexione si en Java haya una expresión que también sea estatuto. Spoiler alert ...
	- Virtual Machine y WORA
	- JVM
	- Bytecode y class
	- JIT compiler (versus AOT compiler. Investigar este último).
	- Stack Machine (ventaje sobre una máquina de registros)
	- AST
	- Postorder y generación de bytecode
	- Desensamblar código (alias javap)
2. Tema a investigar (posible extra) y formarse una idea sobre GraalVM (Nota: ChatGPT 3.5 puede estar desactualizado sobre el tema)
3. Observé que varios de Uds. no tienen muy buenas prácticas de de estilo de código y ya son programadores avanzados. Les recomiendo estudiar algunas, por ejemplo, https://google.github.io/styleguide/javaguide.html las de Google. Invierta en eso, es por su propio beneficio y eso es parte de una buena ingeniería de software!
4. \[Requiere tiempo y mucha paciencia. Es una variante de lo que hicimos en clase\] Usando Java y programación imperativa como la que Ud. conoce: escriba un método recursivo static `int factorial(int n)` que retorne el factorial de n. Use operador ternario para que sea una sola expresión.
	1. Haga el AST de la expresión retornada, genere el post-order. Cuando sea un llamado a una función asuma que hay un nodo INVOKE (también se le puede llamar CALL) cuyos hijos los argumentos de izquierda a derecha (tantos hijos como argumentos que haya) seguido del método llamado. Es decir si hay una expresión foo(a, b) habría un nodo en el AST INVOKE con 3 hijos de izquierda a derecha a, b, foo.
	2. Use javap y vea el bytecode generado y compare con su version en post-orden
	**Nota**: Para saber sobre la list de instrucciones del bytecode de la JVM puede ver https://en.wikipedia.org/wiki/List_of_Java_bytecode_instructions. Recuerde siempre que es una stack machine.