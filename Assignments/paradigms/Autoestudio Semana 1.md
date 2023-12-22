---
type: homework
date: 2023-08-07
turned-in: true
status: Done
tags: homework
---
#  Autoestudio Semana 1

## Ejercicios
1 Repase estos conceptos
	- [[Abstracción (computacional)]]
	- [[Programación imperativa]]
	- [[Programación estructurada]]
	- [[Manejo automático de memoria (recolección de basura)]]
	- [[OOP puro versus impuro]]
	- [[Concurrencia con multicore]]
2 Asuma un assembler con estas especificaciones (por ahora) digámosle por broma ASSONE (el ONE es por UNA)
**Hardware**
Un CPU con memoria RAM, una consola con su teclado para entrada/salida
**Sintaxis**
Similar a un ensamblador como el que Ud. conoce, un programa es una secuencia de instrucciones. Una instrucción por línea. Una instrucción empieza opcionalmente con una etiqueta (identificador seguido por :), el nemónico y los argumentos. Comentarios de una línea con ; (punto y coma)
Ejemplo
SUMA: ADD AX BX; Calcula AX += BX
**Registros Generales de aritmética**
AX, BX
**Registro de dirección de memoria**
BP
**Memoria M**
Un arreglo desde 0 hasta un máximo de posiciones que guardan números binarios   Se direcciona usando BP o una constante, por ejemplo: M[0] o M[BP]
**Entrada/Salida**
La posición 0 de M está reservada para imprimir, es decir, lo que esta en M[0] será impreso en decimal en consola si se ejecuta DIS (display). Y si se ejecuta INP se lee de consola un número decimal y se pone en M[0] su versión en binario
**Operaciones aritméticas**  
ADD, MUL, SUB, DIV toman AX y BX hacen la operación y dejan el resultado en AX  
INC DEC : incrementan  o decrementan en 1 el registro AX o BX o BP  
**Operaciones de movimiento**  
MOV: mueve de memoria a registro y de registro o contante a memoria.  
Por ejemplo  
MOV AX 0 ;pone un cero en AX.  
MOV M[1] BX ;pone el contenido de BX en M[1]  
DIS: escribe en consola en decimal lo que haya en M[0] (pasa de binario a decimal)  
INP: pone en M[0] lo que se teclee en consola (en decimal y se convierte a binario)

**Problema**  
Escriba un programa en ASSONE  que lea tres números a, b y c de consola e imprima en consola el resultado  b ** 2 - 4*a*c  

```ASSEMBLY
-- Diego Quirós Artiñano
INP; -- escribiendo a en M[0]
MOV AX M[0]; -- AX = a
MOV M[1] AX; -- M[1] = a
INP; -- escribiendo b en M[0]
MOV AX M[0]; -- AX = b
MOV M[2] AX; -- M[2] = b
INP; -- escribiendo c en M[0]
MOV AX M[2]; -- AX = b
MUL AX AX; -- se podría hacer SHL AX; (shift left), se hizo AX**2
MOV M[2] AX; -- M[2] = b**2
MOV AX M[1]; -- AX = a
MOV BX M[0]; -- BX = c
MUL AX 4; -- AX *= 4
MUL AX BX; -- AX *= c
MOV BX M[2]; -- BX = b**2
-- ; AX == 4ac BX == b**2
SUB BX AX; -- BX -= 4ac
MOV M[0] BX; -- M[0] = b**2 - 4ac
DIS; -- imprime la respuesta
HLT; -- exit 0
```


3) Use un prompt como este en ChatGPT o similar (puede refinarlo con subsecuentes preguntas para mejor contexto)

  

"Dame un ejemplo que me permita entender go rutinas en el lenguaje Go"

  

Estudie las respuestas y sea capaz de explicarlas

Básicamente hilos pero menos pesados, los green threads the java por ejemplo