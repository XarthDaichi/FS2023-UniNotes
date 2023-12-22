/*
CODIGO EN OFS
    let foo = x -> true

    const trueValues = [* false, n -> true] >> [! 1] && foo(x) * 2 + 1

    const something = [* n, n -> 2 * n * n - n * 3 + 666 * goo(666) ]

    something >> [! 10] [> n -> console.log(n) ]

    let n = 666

    let hoo = [* n, n -> n + 1] >> [? n -> n % 2 == 0 || n % 3 == 0] >> [! n + 2]
*/

/*
CFG

arith->expr > ???
2 * n * n - n * 3 + 666 * goo(666)

arith_expr -> ident | number | arith_expr ("*" | "/" | "+" | "-") arith_expr | ...
ident -> ...
number -> ...
PROBLEMA!!! es recursiva izquierda (RI) "ciclo infinito"

ELIMINAR "a mano RI"

2 * n * n - n * 3 + 666 * goo(666) ~ m1 - m2 + m3
m1 = 2 * n * n (m_i = monomio, arith_expr es una suma de monomios)
m2 = n * 3
m3 = 666 * goo(666)

m1 = f1 * f2 * f3 
f1 = 2 (f_i = factor, monomio es un producto de factores)

otro grado de complejidad 2 * n * n - n * 3 + 666 * goo(666) + 2*(x + x*y)
*/

/*
CFG sin RI

arith_expr -> monom(("+" | "-") monom)*

monom -> factor (("*" | "/") factor)*

factor -> ident | number | "(" arith_expr ")" | "-" arith_expr

ident -> ...
number -> ...
*/


%%%%%%%%%%%%%%%%%%%%%%%%%%%% PARSER %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
arith_expr(T) --> sum_monom(T).

sum_monom(T) --> monom(M), rest_sum_monom(L), {L = [Oper, TR] -> T =.. [Oper, M, TR] ; T = M}.

rest_sum_monom([Oper, T]) --> plus_minus(Oper), sum_monom(T).
rest_sum_monom([]) --> [].


monom(F) --> mult_factor(F).

mult_factor(F) --> factor(FL), rest_mult_factor(L), {L = [Oper, FR] -> F =.. [Oper, FL, FR] ; F = FL}.

rest_mult_factor([Oper, F]) --> times_div(Oper), mult_factor(F).
rest_mult_factor([]) --> [].

factor(I) --> ident(I).
factor(N) --> number(N).
factor(T) --> "(", arith_expr(T), ")".
% factor([Oper, T]) --> plus_minus(Oper), arith_expr(T).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% LEXER %%%%%%%%%%%%%%%%%%%%%%%%

plus_minus(+) --> "+".
plus_minus(-) --> "-".
times_div(*) --> "*".
times_div(/) --> "/".

ident(x) --> "x".
ident(y) --> "y".

number(1) --> "1".
number(2) --> "2".
number(666) --> "666".

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

test_parser(S, T) :-
    string_codes(S, Codes),
    arith_expr(T, Codes, [])
.