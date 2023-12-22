
:- use_module(library(csv)).

:- initialization 
   csv_read_file('test.csv', Rows, [functor(person), arity(4)]),
   writeln(Rows),
   maplist(assert, Rows)
.

% withSameAge(+LP, +A, -LSA).

/*
withSameAge([], _, []).
withSameAge([P | R], A, LSA) :-
   withSameAge(R, A, LSAR),
   (P \= person(_, _, _, A) 
      -> LSA = LSAR
      ; LSA = [P | LSAR]
   )
.
*/

hasAge(person(_,_,_, A), A).
% withSameAge(LP, A, LSA) :- findall(LP, person(_, _, _, A), LSA).
withSameAge(LP, A, LSA) :-
   findall(person(I, N, G, A), member(person(I,N,G,A), LP), LSA).