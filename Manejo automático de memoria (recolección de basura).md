---
Topic: Manejo automático de memoria (recolección de basura)
Date: 2023-08-06
Course: Paradigms
tags: notes paradigms
---

https://learn.microsoft.com/en-us/dotnet/standard/garbage-collection/fundamentals

Es un programa que permite desalocar la memoria no utilizada por los objetos, esto hace que no se tenga que manualmente mantener la cuenta como en C++ y sus delete punteros. Lo devuelve al heap de una manera "eficiente" y no lo hace de manera segura para que los objetos no agarren memoria de otro objeto (segmentation faults o null ptr exceptions)