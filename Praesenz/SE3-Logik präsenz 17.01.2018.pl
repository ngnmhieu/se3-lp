%Variante 1
istSchaltjahr(X) :- 0 is X mod 400,!.
istSchaltjahr(X) :-	0 is X mod 4, not(0 is X mod 100).

%Variante 2
s(X) :- 0 is X mod 400, !.
s(X) :- 0 is X mod 100, !, fail.
s(X) :- 0 is X mod 4.

%Monatslänge
tage(J,2,29) :- s(J), !.
tage(_,2,28) :- !.
tage(_,M,30) :- member(M,[4,6,9,11]), !.
tage(_,_,31).





