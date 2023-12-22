
:- use_module(library(http/json)).

test_json(File, JsonTerm):-
   open(File, read, Stream),
   json_read(Stream, JsonTerm)
.