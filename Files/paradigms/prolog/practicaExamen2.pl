n_esimo([E | _], 0, E).
n_esimo([_ | R], N, E) :- N1 is N - 1, n_esimo(R, N1, E).



n_esimo(L, K, E) :-
	K >= 0, length(L, N), K < N,
	n_esimo(L, 0, K, E)
.
n_esimo([E | R], K, K, E) :- !.
n_esimo([_ | R], I, K, E) :- I1 is I + 1,
	n_esimo(R, I1, K, E)
.

/*
    llb -> ident "(" arg* ")"
    arg -> "0" | "1" | llb
    ident -> "f" | "g" | "h"
*/

% DCG

llb --> ident, "(", args, ")".

args --> arg, rest_args.
args --> [].

arg --> binary_digit.
arg --> llb.

rest_args --> "," , args.
rest_args --> [].

binary_digit --> [D], {member(D, [48, 49])}.
% binary_digit --> [D], {string_codes(S, D), member(S, ["0", "1"])}. SI NO SE SABEN LOS CODIGOS DE 0 o 1

ident --> function_char.

function_char --> [C], {string_codes(S, C), member(S, ["f", "g", "h"])}.