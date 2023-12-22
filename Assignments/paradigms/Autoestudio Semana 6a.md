---
type: homework
date: 2023-09-07
turned-in: false
status: Not Started
tags: homework
---
#  Autoestudio Semana 6a
**Ejercicios**

Repase, revise, amplie estos conceptos

- (In)mutabilidad de datos: ventajas y limitaciones
- Efectos secundarios
- Transparencia referencial
- Estándares ESM (import/export) y CJS(require) de módulos en JS
- Desestructuración en JS

  

1) Lea un poco sobre por qué el lenguaje Go (aka Golang) usa una forma de OOP que no es la usual en lenguajes como C++ o Java. ¿Qué razones de diseño los llevaron a esa decisión en Google?
- No tiene inheritance, se tiene que hacer por composición
- Todo es por structs, no usa clases
- lo privado se define comenzando el tipo con minúscula: pelicula, lo público se define comenzando con Mayúscula: Pelicula
- Si tiene interfaces para hacer polimorfismo
  

2) Si no lo hizo, haga comp_multiple de semana 5b usando reduce (debe salirle en una línea). Haga pruebas de que funciona.

```javascript

let id = x => x

let comp_multiple = (a) => a.length === 0 ? id : a.reduce(e => comp_multiple())
```
  

3) Pruebe que el patrón (o combinador) de FP filter se puede simular con reduce

Es decir haga una función  filter(a, f) que se comporte como a.filter(f) pero implementada con a.reduce.

4) En [Dia-10](https://drive.google.com/drive/folders/117WpUdlbDfLfV2o5WWv-qGxp3T_IPKay?usp=drive_link) ([acá](https://drive.google.com/file/d/1_9AvjkMdtiamF7f1kx9_JFXeqwc-iIDy/view?usp=drive_link)) encuentra uan forma de un objeto literal que representa una página html codificada como objeto de JS (ver variable doc). Un elemento es de la forma {tag, atts, children} tag es el string del tag, atts un array de los atributos y children un array de los elementos debajo de ese tag. Los atributos son objetos de la forma {name:value}. Hay una excepción que son los elementos textuales, que son simplemente hileras.

**Hints**. El objecto Object tiene métodos para extraer propiedades de objetos. Por ejemplo: Object.keys, Object.values, Object.items.

  

Escriba una función element_toString(element) que reciba en element un objeto de una codificación así y devuelva una hilera que sea el html de la página codificada en JS. 

Por ejemplo, para el valor doc que viene en el archivo, la salida sería una hilera como:

<html ><head ><title >My Page </title> </head> <body ><h1 style="color:blue;text-align:center" >Hello World </h1> <div id="App" ></div> <script src="../scripts/main.js" type="application/javascript" ></script> <script type="application/javascript" >  
let n = 666;  
 console.log(n)  
 </script> </body> </html>  

Que "embellecida" se vería así (pero su programa **no necesita emebellecerla**, para eso hay herramientas aparte)

<html>  
  <head>  
    <title>My Page </title>  
  </head>  
  <body>  
    <h1 style="color:blue;text-align:center">Hello World </h1>  
    <div id="App"></div>  
    <script src="../scripts/main.js"    type="application/javascript"></script>  
    <script type="application/javascript">  
      let n = 666;  
      console.log(n)  
    </script>  
  </body>  
</html>  

Se espera una solución FP (que aproveche desestructuración) en un módulo html.js (CJS) y un módulo test_html.js que  usa html.js y genera la salida.

Puede modelar usando funciones auxiliares, para un mejor estilo Knuth.