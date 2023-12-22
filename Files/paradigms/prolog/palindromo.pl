bin_palind --> [L], {firstlast(L), L = [_ | R]}, bin_palind(R).
% bin_palind --> bin, bin_palind, bin.
bin_palind --> bin.
bin_palind --> [].

bin --> [X], {member(X, [0,1])}.
firstlast([F, F]) :- bin(F).
firstlast([F,_|T]) :- firstlast([F|T]).