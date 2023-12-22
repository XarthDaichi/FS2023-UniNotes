p(person{id:1, name:name{first:juan, last:perez}, age:20, gender:male}).

% fullName(+P, -S)
fullName(P, S) :- 
    is_dict(P),
    _{id:_, name:N, age:_, gender:_} :< P, !,
    is_dict(N),
    _{first:F, last:L} :< N, !,
    atomic_list_concat([L, ', ', F], S)
.