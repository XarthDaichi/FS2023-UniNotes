---
Topic: SGA
Date: 2023-08-17
Course: Databases-II
tags: notes databases
---

Systems General Area

es la estructura de memoria más importante de oracle. El SGA almacena varios componentes diferentes del uso de la memoria que están diseñados para ejecutar procesos para obtener datos para las consultas de los usuarios lo más rápido posible y, al mismo tiempo, maximizar la cantidad de usuarios simultáneos que pueden acceder a la instancia de Oracle. Los componentes principales del SGA son:

## caché de buffer
| Usuario | Instrucción                        | K Hash |
| ------- | ---------------------------------- | ------ |
| 1       | select a,b,c from t1;              | 80     |
| 2       | update t2 set x = 4; where 2 = 10; |        |
| 3        | select a,b,c from t1;                                    | 80        |

Como el usuario 1 y el 3 hicieron la misma instrucción tienen el mismo hash, como tienen el mismo hash, entonces se ingresa en el caché

SP: se vería como:

| Proceso | SQL        | K hash | Raiz                                         | Raiz de Arbol |
| ------- | ---------- | ------ | -------------------------------------------- | ------------- |
| 303517  | select ... | 80     | \* (puntero a la lista enlazada (respuesta)) |       \* (puntero al arbol de respuesta)        |


[[Analizador de SQL]]