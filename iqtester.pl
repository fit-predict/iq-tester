jump(a, b, d).
jump(a, c, f).
jump(b, d, g).
jump(b, e, i).
jump(c, e, h).
jump(c, f, j).
jump(d, g, k).
jump(d, h, m).
jump(d, e, f).
jump(d, b, a).
jump(e, h, l).
jump(e, i, n).
jump(f, i, m).
jump(f, j, o).
jump(f, c, a).
jump(f, e, d).
jump(g, h, i).
jump(g, d, b).
jump(h, i, j).
jump(h, e, c).
jump(i, e, b).
jump(i, h, g).
jump(j, f, c).
jump(j, i, h).
jump(k, g, d).
jump(k, l, m).
jump(l, h, e).
jump(l, m, n).
jump(m, i, f).
jump(m, h, d).
jump(m, l, k).
jump(m, n, o).
jump(n, m, l).
jump(n, i, e).
jump(o, n, m).
jump(o, j, f).

%Example
%play([a, b, c, d, e, f, g, h, i, k, l, m, n, o], [j], []).

play(_, LNC, SOL):- 
length(LNC, 14), write('SOLUTION: '), nl, write(SOL), nl, nl.

play(LO, LNC, SOL):-
member(C, LNC),
jump(A, B, C),
\+ member(A, LNC),
\+ member(B, LNC),
A \= B,
append([A], LNC, R),
append([B], R, R2),
del(C, R2, R3),
append([A], [C], TMP),
append(SOL, [TMP], SOL2),
length(LNC, LLNC),
length(R3, LR3),
LLNC < LR3,
play(LO, R3, SOL2).
		  

del(_, [], []).
del(X, [X|Xs], Y) :-
    del(X, Xs, Y).
del(X, [T|Xs], [T|Y]) :-
    X \= T,
    del(X, Xs, Y).
	