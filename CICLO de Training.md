---
Topic: CICLO de Training
Date: 2024-04-22
Course: AI
tags:
  - notes
  - flashcards
  - AI
cards-deck:
---
1. Dataset (X,Y), a veces se tiene que seleccionar el Y (hecho por humano + AI)
2. Curar
3. Select Model (de alguna librería de modelos)
	- Deep Learning
	- Regresión Lineal 
	- Regresión Logística (función de activación, como sigmoide)
4. SPLIT ---> X_train, Y_train | X_test, Y_test
5. Train + min_loss
6. Validation

con esto se construye un PREDICTOR:
- puede ser un:
	- CLASIFICADOR (conjunto finito)
	 $y \in K \text{ finito}$
	- REGRESOR (cualquier número real)
	 $y \in \mathbb{R}^{K}$
	 
![[CICLO de Training 2024-04-22 13.24.34.excalidraw]]