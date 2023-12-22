content(merry, red).
content(mia, red).
content(henry, red).
content(Names, red) :- colors(Names).
colors(mia).
siblings(A,B):-content(A,C),content(B,C),A\=B.
