is_decimal_digital(D) :- member(D, [0,1,2,3,4,5,6,7,8,9]) .
is_minus_or_plus(D) :- member(D, [+,-]) .

entero(E) --> entero_no_signado(E).
entero([S|E]) --> [S], {is_minus_or_plus(S)}, entero_no_signado(E).
entero_no_signado([D|RE]) --> [D], {is_decimal_digital(D)}, rest_entero(RE).
rest_entero([]) --> [].
rest_entero([D|RE]) --> [D], {is_decimal_digital(D)}, rest_entero(RE).