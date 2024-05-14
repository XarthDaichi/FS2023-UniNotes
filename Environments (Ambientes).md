---
Topic: Untitled
Date: 2024-02-19
Course: 
tags:
  - notes
  - flashcards
cards-deck:
---
Es de Python, los ambientes es crear distribuciones, si yo le quiero instalar paquetes para una aplicación y después para otra y que no choquen dependencias un ambiente o venv se utiliza

En Anaconda:
BASE: ambiente default

nn: ambiente curso

```cmd
(base) C:\Users\diego> conda activate nn
(nn) C:\Users\diego> conda bat deactivate
```


```python
import numpy as np
a = np.array([1,2,3])
type(a)
# <class 'numpy.adarray'> # más optimo que un list(), por ejemplo memoria contigua
a[0]
# 1

```