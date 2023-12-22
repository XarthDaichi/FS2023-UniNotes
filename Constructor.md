---
Topic: Constructor
Date: 2023-10-02
Course: Paradigms
tags:
  - notes
  - paradigms
---

![[Pasted image 20231002182051.png]]
![[Pasted image 20231002182122.png]]
![[Meta Modelo OOP De JS 2023-10-02 18.25.45.excalidraw]]

Se pueden hacer los propios constructores:
```javascript
function Person(name, gender, age) { // La primera letra de un constructor es en Mayuscula
	[this.name, this.gender, this.age] = [name, gender, age]
}```
Se asume que this va a estar disponible al ejecutarlo (new, se encarga de eso)
![[Pasted image 20231002183932.png]]
