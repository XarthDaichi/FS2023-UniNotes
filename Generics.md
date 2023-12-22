---
Topic: Generics
Date: 2023-08-24
Course: Paradigms
tags: notes paradigms
---

``` java
class Fruit{};
class Apple extends Fruit {};
List<Apple> la = ArrayList<>();
List<Fruit> lf = la; // se queja porque java no tiene generics en la maquina virtual
```
Esto ocurre porque si después le agregas una Naranja a lf, le terminarías agregando Naranjas a la listas de Manzanas

Varianza:
- Invarianza
- Covarianza
- Contravarianza

Sean A y B dos tipos tal que A <: B
y C<\T>
Construya T = A C\<A> y T = B C\<B>
1. C\<A> <: C\<B> si T es covariente
2. C\<A> :> C\<B> si T es contravariante
3. Caso contrario T es invariante

List\<T> en Java es invariante

>[!faq] Como hacer el List\<T> covariante
> List\<? extends T> **Pero es read-only**, podes declarar con T y con todos los hijos de T


```java
List<? extends Food> lf = Arrays.asList(new Apple(), new Orange())
lf => [Apple@dirmem, Orange@dirmem]

lf.add(new Apple()) // ERROR porque este List<? extends T> solo deja read
```

>[!faq] Como hacer para que el List\<T> sea contravariante y deje hacer escrituras
> List\<? super T>
> Pero los casteos te toca hacerlos a vos

```java
class Problem{};
class Math extends Problem{};
class Solver<T>{};

boolean solve(Math p, Solver<? super Math> s){return 0;} // tal vez si no lo arregla con Math logra alguno de arriba
```



T\[] en Java es covariente
