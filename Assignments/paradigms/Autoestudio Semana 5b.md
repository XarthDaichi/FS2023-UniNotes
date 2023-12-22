---
type: homework
date: 2023-09-04
turned-in: false
status: Not Started
tags: homework
---
#  Autoestudio Semana 5b
1) Revise, repase y extienda  

- Composición de funciones
- "Burocracia del diseño" en OOP (término no estándar que invento yo)

Para este punto use ChatGPT por ejemplo con el  prompt de abajo,  estudie su respuesta, esté en disposición de explicarla. 

Nota: Ud. puede no estar de acuerdo conmigo o con ChatGPT de que la burocracia del diseño sea mala per se. Sea crítico y asertivo.  
**Prompt**  
_En programación orientación a objetos, en especial en lenguajes como Java, hay una alta, digamos, burocracia de diseño, quiero decir, se deben crear las clases y las relaciones entre ellas (como herencia) antes de poder escribir código operacional._  
  
2) En matemática o es un operador sobre funciones (y relaciones). ¿Cuáles propiedades algebraicas cumple? (indique falso o verdadero, en el primer caso dé un contraejemplo) donde f, g, h son cualesquiera funciones que se puedan componer. Indique el nombre de la propiedad en cada caso.

  

a) f o i = i o f = f  (donde i es la función identidad) = VERDADERO

b) f o (g o h) = (f o g) o h = VERDADERO (f(g(h(x))) = f(g(h(x))))

c) f o g = g o f = FALSO porque <=> f y g biyectivas

  
3) Escriba en FP-JS una función multiple_comp(a) que reciba un array de funciones a (asuma que todas son de un solo argumento), y retorna una función que se comporta como la composición de todas las funciones en a.  (Nota: no le hemos dicho, pero [[Recursión]] es considerado una parte natural de la [[Programación Funcional]]).

  
**Reglas para**  multiple_comp(a)  

1. Si  a está vacía retorna la función identidad
2. Si  a solo tiene una función retorna esa función
3. Si  a tiene n funciones f1, f2, ..., fn con n > 1 entonces retorna una función que se comporta como f1 o f2 o ... o fn

**Nota**: Usamos que (f o g)(x) = g(f(x)) (g se come lo que f generó primero)

**Ejemplo** (úselo como caso de prueba)  
Asuma a = [f1, f2, f3] tales que  
f1(x) = 2 * x  
f2(x) = x ** 2  
f3(x) = x + 2  
Si h = multiple_comp(a) entonces para un humano, que hace el trabajo algebraico de derivar la forma de h, se debería cumplir que  
h(x) = multiple_comp(a) = (f1 o f2 o f3)(x) = 4 * x\*\*2 + 2

```javascript
multiple_comp = (a) => {
	if (a.length === 0) {
		return f = (x) => x
	}
	if (a.length === 1) {
		return a[0]
	}
	return a[a.length-1] = (x) => multiple_comp(a.pop())
}
```

```Javascript

const comp = (f,g) => x => g(f(x)) // no Wikipedia
const id = x => x

const comp_multiple = a => {
	if (a.length === 0) return id
	const [f, ... rest] = a
	if (rest.length === 0) return f
	return comp(f,comp_multiple(rest)) 
}
```



quiz ejemplo:
```javascript

split_aux = (a,f,r) => {
	if (a.length === 1) {
		
	}
}

split = (a,f) => {
}
```
PD.  

1) Hoy no hubo pizarras electrónicas. He subido la solución al quiz y el .js del ejemplo sobre composición de las 6pm que en principio sería el mismo para todos ([Dia-09](https://drive.google.com/drive/folders/11qbq_HcWKa2o6G7WB8U9ETYyzIgSsy53?usp=drive_link)).

2) Mañana en la tarde subo las notas del quiz de hoy