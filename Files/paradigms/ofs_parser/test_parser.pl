:-[ofs_parser].
:- use_module(library(readutil)).

test_parser(Filename) :-
    read_file_to_codes(Filename, Codes, []), 
    ofs_parser(Ast, Codes, []), !,
    format('~n*** ~s was correctly parsed. Yay!!!', [Filename]),
    format('~n*** AST = ~q', [Ast]),
    purifier(Ast, AstWithoutNulls),
    format('~n*** AST purified= ~q', [AstWithoutNulls]),
    atomic_list_concat([Filename, js], '.', JSFilename),
    generator(JSFilename, AstWithoutNulls)
.

test_parser(Filename) :-
    format('~*** ~s was NOT correctly parsed. Boooo!!!', [Filename])
.

purifier(Ast, AstWithoutNulls) :-
    eliminate_null(Ast, AstWithoutNulls)
.
