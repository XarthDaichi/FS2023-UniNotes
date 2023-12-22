---
type: homework
date: 2023-08-24
turned-in: false
status: Started
tags: homework
---
#  Autoestudio Semana 4a
1) Revise, entienda y amplie los siguientes conceptos/afirmaciones  

- Partes de un compilador
- Parser (Syntax Analysis)
- Typer  (Static Semnatic Analysis)
- AST
- ST (symbol table)
- Syntax Error
- Static Semantic Error
- Lenguage "estático" vs "dinámico"
- Explique afirmación: "_Un lenguaje estático son dos lenguajes en uno_".
- Reference type vs Primitive Type
- Boxing/Unboxing
- Type parameter
- Generics y su beneficio
- Type erasure (borrado de tipos)

2)  
a) Considere el siguiente código  
var a = new Integer[]{1,2,3};  
var b = new ArrayList<\Integer>();  
¿Cuál es el tipo estático del respectivo lado derechos de esas dos asignaciones? 
- Los dos son Arrays, solo que uno es generic y el otro no
¿Cuál es el tipo dinámico de a y cuál el de b? (puede averiguarlo usando a.getClass() y b.getClass())  
- \[Ljava.lang.Integer]
- java.util.ArrayList
Compare esos tipos y explique una importante diferencia que no es la obvia:  que uno es un array y el otro un ArrayList?  
El ArrayList es la clase de Generics de Java, mientras que el otro es un array definido normal de Java

b) Explique de manera clara y precisa por qué el siguiente código no compila en Jshell (por ende ni con Javac)  
List<\Apple> la = new ArrayList<\>();  
List<\Fruit> lf = la;  
¿Cómo se podría corregir el problema?

  
c) Verifique que este ejemplo abajo **sí compila** en el Jshell (y con javac) (a pesar de que en principio polucionaría aa) pero la JVM sí detecta el problema con una excepción en tiempo de ejecución. Indique cómo se llama la Excepción  
class Fruit{};  
class Apple extends Fruit{}  
class Orange extends Fruit{}  
Apple[] aa = new Apple[1];  
Fruit[] fa = aa;  
fa[0] = new Orange();  
  
3) Considere el siguiente código  
**final** **class** Person{  
    **final** private String name;  
    **final** private int age;  
    **public** String getName(){return [this.name](http://this.name);}  
    **public** int getAge(){ return this.age;}  
    **public** String toString(){  
        return String.format("Person(%s, %d)", name, age);  
    }  
    **public** Person(String name, int age){  
        [this.name](http://this.name) = name;  
        this.age = age;  
    }  
}  
Construya una **class** PersonComparator{...} que permita comparar (menor a mayor) dos instancias de Person primero por name y luego por age. Construya ejemplos de prueba que compare a los siguientes objetos. Use [Comparator](https://docs.oracle.com/javase/8/docs/api/java/util/Comparator.html) del JDK.  

  
**var** juan1 = new Person("Juan", 20);  
**var** juan2 = new Person("Juan", 25);  
**var** maria = new Person("Maria", 20);  
  
**class** PersonComparator ... // su respuesta  
  
Comparator<Person> cp = ... //  su respuesta  
println(cp.compare(juan1, juan1)) // son "iguales"  
println(cp.compare(juan1, juan2)) // juan1 "es menor" que juan2  
println(cp.compare(juan1, maria)) // juan1 "es menor" que maria