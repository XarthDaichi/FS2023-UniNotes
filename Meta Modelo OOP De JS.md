---
Topic: Meta Modelo OOP De JS
Date: 2023-10-02
Course: Paradigms
tags:
  - notes
  - paradigms
---
¿Cómo se implementa la [[Orientación a Objetos]] en [[javascript]]

Los Meta Propiedades pueden ser:
- [[Constructor]]: ¿Quién Construyó el objeto?
- [[__proto__]]: Para las herencias


Algoritmo de búsqueda de property
obj.p
1. Si obj === null --> Exception
2. Si no
	1. Busque p en los OWN
	2. Si está retorne el valor STOP.
3. Busque p en obj.\_\_proto\_\_

O(n), n la cantidad de protos atravesados

final optimiza, pero es más que todo para que no le caigan encima

```javascript
function Person(name, gender, age) {
	[this.name, this.gender, this.age] = [name, gender, age] // ES6
}

Person.prototype.ageAfterYears = function(n) {return this.age + n;}

const juan = new Person('Juan', 'M', 22)
const maria = new Person('María', 'F', 20)

const people = [juan, maria]

for (const p of people) { console.log(p) }

function Employee(name, gender, age, income) { 
	Person.call(this, name, gender, age); 
	this.income = income;
}

const pedro = new Employee('Pedro', 'M', 20, 2000)
console.log(perdo)
```

>[!info] Uso del Meta Modelo
>Se utiliza más que todo para hacer frameworks, o librerías, código para hacer más código


