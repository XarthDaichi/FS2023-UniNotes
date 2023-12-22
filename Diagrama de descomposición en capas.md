---
Topic: Diagrama de descomposición en capas
Date: 2023-08-07
Course: IngeII
tags: notes inge
---

```mermaid
graph TD
1[presentation]
2[control]
3[elementos comunes]
4[APISs]

1 -. use .-> 2
1 -. use .-> 3
2 -. use .-> 4

```

