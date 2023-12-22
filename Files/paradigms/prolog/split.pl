/*
split([1,2,3,4,5,6], L, U).
L = [1,2,3]
U = [4,5,6]
*/

% split(+A, -L, -U)
split(A, L, U) :-
    length(A, N),
    Half is N / 2,
    

.