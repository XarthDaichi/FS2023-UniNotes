super_fibo(N, F) :- member(N, [0,1,2]), F = N.
super_fibo(N, F) :- 
 	N >= 3,
 	N1 is N - 1, super_fibo(N1, F1),
 	N2 is N - 2, super_fibo(N2, F2),
 	N3 is N - 3, super_fibo(N3, F3),
 	F is F1 + F2 + F3
.

/*
super_fibo_rec(N, F) :-
    N >= 3,
    NS is N - 3,
    super_fibo_rec(NS, N, F)
.

super_fibo_rec(N, N, F) :-
    F 
.

super_fibo_rec(NS, N, F) :-
    NS < 3,
    
.
*/