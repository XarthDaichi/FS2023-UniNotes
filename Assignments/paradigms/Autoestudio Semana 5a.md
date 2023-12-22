---
type: homework
date: 2023-08-31
turned-in: false
status: Not Started
tags: homework
---
#  Autoestudio Semana 5a
**Ejercicios Autoestudio**

1) Revise, repase y extienda los siguientes conceptos

- Transpilación:
    - React JSX
    - TS
- Herramientas
    - tsc
    - ts-node
    - nodemon
- Programación Funcional (acortaremos a FP)
- Nivel de abstracción en FP sobre programación imperativa clásica (for, while, etc)
- Programación "a la Knuth" (como en [programación literaria](https://en.wikipedia.org/wiki/Literate_programming))
- Función como objeto, dato o valor  (en inglés se dice _function as first-class citizen_)

2) En estilo FP y en JS (combinación que llamaremos FP-JS) y desarrollando casos de prueba que corran en node. Ponga sus respuestas en un script semana5a.js que se pueda correr así: node semana5a.js. Al menos dos casos de prueba por ejercicio.

Siga y complete el [modelo del script](https://drive.google.com/file/d/1_fC08gWh8CvlKDAUtQf9369qXKbBXio2/view?usp=drive_link). Ajuste los casos de prueba según cada ejercicio.

Busque un estilo Knuth (parafraseando: el arte de escribir código pensando empáticamente en el pobre diablo que va a tener que leerlo)

a) Escriba compose(f, g) tal que compose(f, g)(x) = f(g(x)) para todo x talque f(g(x)) esté definida. 

b) Escriba minOfArray(a) que retorne el menor número en el array a de números, asumiendo que a no está  vacío. 

c) Escriba una función lessThan(a, x) que cuente cuántos elementos en el array a de números son menores que el número x

d) Escriba una función split(a, f) que reciba un array a  y una función f definida sobre los objetos en a y que puede retornar true o false,  tal que se cumpla que split(a, f) retorna un array [yes, no]  donde yes un array con elementos e en a que cumplen f(e) = true y no un array con el resto  Que sea O(n) donde n=a.length.  **Nota**: a cualquier función como f la llamaremos en FP un predicado.