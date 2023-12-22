---
type: homework
date: 2023-10-05
turned-in: false
status: Not Started
tags: homework
---
#  Autoestudio Semana 10a
0. Revise, repase y amplíe:
	1. Metamodelo de objetos
	2. Relaciones en el grafo de prototipos
	3. Own properties vs metaproperties
	4. \_\_proto\_\_ versus prototype
	5. Explique la afirmación: "\_\_proto\_\_ permiten la herencia en JS"
	6. constructor
	7. Function versus Object
**Sugerencia:** haga un documento que recoja todos los ejercicios asignados tras cada clase y haga soluciones.

1. Escriba una función `allConstructorsUpTo(obj)` que recibe un objeto obj de JS y retorne la lista de los constructores que se encadenan partiendo de obj.constructor. Asuma que obj no es null ni undefined. No puede usar programación imperativa.

2. Usando ES6, haga un modelo OOP que modele un árbol binario BinaryTree y árbol binario de búsqueda BinarySearchTree que hereda de BinaryTree. Encapsule en un módulo ESM tree.mjs. Haga pruebas de cada método en árboles no triviales en testTree.msj.

Requerimientos mínimos:
\* BinaryTree tiene estos métodos para todo Binary Tree t
1. t.left(), t.right(), t.root() que retornan respectivamente lo esperado.
2. t.isEmpty() que retorna true si t está vacío, false en caso contrario
3. t.nodeData(), t.isLeaf(), t.isInterior() predicados que retornan respectivamente lo esperado visto t como un nodo
4. t.height() que calcula la altura de t. Un árbol vacío y las hojas de un árbol tienen altura de cero por definición
5. t.balanceFactor() que retorna la diferencia entre la altura del hijo izquierdo menos la del hijo derecho. Las hojas tienen balanceFactor de 0 al igual que un árbol vacío.

\* BinarySearchTree tiene para todo BinarySearchTree t
1. t.search(d) returna n si n.NodeData() === d en algún nodo n en el BinarySearchTree t. Devuelve null en caso de no existir n.