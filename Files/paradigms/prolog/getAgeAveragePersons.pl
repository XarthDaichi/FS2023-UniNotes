:- [csv_test].

% getListOfPersons(-LP): LP es la lista de personas

getListOfPersons(LP) :-
    findall(person(I, N, G, A), person(I, N, G, A), [_ | LP]) % select id, name, gender, age from persons;
.

% getAgeSumPersons(+LP, -S) : true si S es la suma de edades en lista LP de personas
getAgeSumPersons([], 0).
getAgeSumPersons([person(_, _, _, A) | Rest], S) :-
    getAgeSumPersons(Rest, SR),
    S is A + SR
.

% getAgeAveragePersonas(-A): true si A es promedio edades de lista LP de personas

getAgeAveragePersonas(A) :- 
    getListOfPersons(LP),
    getAgeSumPersons(LP, S),
    length(LP, N),
    A is S / N
.

winner( oldest(N, A), oldest(_, RA), oldest(N, A)) := A > RA.
winner( oldest(_, A), oldest(RN, RA), oldest(RN, RA) ) := A =< RA.

findOldest( [], oldest(none, 0) ).
findOldest( [person(_, N, _, A) | Rest ], W) :-
    findOldest( Rest, oldest(RN, RA) ),
    winner( oldest(N, A), oldest(RN, RNA), W)
.

getOldestPerson(oldest(N, A)) :-
    getListofPersons(LP),
    findOldest( LP, oldest(N, A) )
.