% hacer eliminate_null(+L, -M) L es la lista de términos y M es la lista sin nulls

% version recursion

% usando metapredicados

% usando delete/3

/*
CFG
expr -> arrow_expr
arrow_expr -> pipe_expr ("->" expr)*
pipe_expr -> simple_expr (">>" expr)*
simple_expr -> monom (("+"|"-")? monom)*
monom -> factor (("*"|"/")? factor)*
factor -> call | literal | "(" expr ")" | "-" expr | expr_list
call -> ident ("(" expr_sequence? ")")?
expr_list -> "[" expr_sequence? "]"
expr_sequence -> expr ("," expr)*
ident -> [a-zA-Z_$][a-zA-Z0-9_$]*
literal -> number | boolean | "null" | "undefined"
number -> [+-]?[0-9][0-9]*
boolean -> "true" | "false"
*/

% reescribi el DCG

% Añada operaciones lógico y relacionales (&&, ||, !=, ==, ! >)

% ¿Qué habría que hacer para tener hileras (string)?