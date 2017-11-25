% Blatt04
% Nico Hahn 6990715
% Hieu Nguyen 6632126

% Aufgabe 1 - Unifikation
%?- h(g(F,k),g(k,F)) = h(g(m,H),g(H,m)).
% F = m,
% H = k.
% Das Praedikat h wird erfolgreich unifiziert, dann 
% folgt die Unifikation von g(...). Aus der Unifikation
% ergibt sich die Variablenbindungen F = m, H = k.

% ?- d(x,d(y,d(z,nil))) = d(X,Y).
% X = x,
% Y = d(y, d(z, nil)).
%
% d wird erfolgreich unifiziert.
% X wird dann an x gebunden.
% Y wird an d(y, d(z, nil))

% ?- m(X,c(g),h(X)) = m(t(r,s),c(u),h(g(T)),t).
% false.
%
% m wird zunaechst unifiziert. X wird an t(r,s) gebunden.
% Es schlaegt fehl bei der Unifikation von c(g) und c(u).

% ?- p(a,p(b,p(c,nil))) = p(X,p(Y,p(Z,nil))).
% X = a,
% Y = b,
% Z = c.
%
% TODO

% ?- t(t(t(a,b),c),t(d,t(e,f))) = t(P,t(Q,R)).
% P = t(t(a, b), c),
% Q = d,
% R = t(e, f).
%
% TODO

% ?- False = not(false).
% False = not(false).
% Hier findet nur eine Unifikation statt und False wird an not(false) gebunden

% Aufgabe 2
% 2.1
% peano2int(+Peano,-Int)
peano2int(0,0).
peano2int(s(X),Y) :- peano2int(X,Z), Y is Z + 1.

% 2.2 unmittelbarer Nachfolger
nachfolger(X,s(X)).
% oder
% nachfolger(0,s(0)).
% nachfolger(s(X),s(Y)) :- nachfolger(X,Y).

% 2.3 unmittelbarer Vorgaenger
% vorgaenger(?X, ?Y).
% TODO

% 2.4 kleiner gleich
% lte(?X,?Y)
% TODO

% 2.5 Pruefe ob Peano2 = Peano1 * 2
% verdoppelt(?Peano1, ?Peano2)
% TODO

% 2.6 Sub = Peano1 - Peano2
% sub(?Peano1,?Peano2,?Sub)
sub(X,0,X).
sub(s(X),s(Y),R) :- sub(X,Y,R).
% oder durch Wiederverwendung von add/3
% add(0,X,X).
% add(s(X),Y,s(R)) :- add(X,Y,R).
% sub(X,Y,Sub) :- add(Sub,Y,X).

% 2.7
% min(+X,+Y,-Min)
min(X,0,X).
min(0,X,X).
min(s(X),s(Y),s(Min)) :- min(X,Y,Min).

% Aufgabe 3
?- consult('dateiverzeichnis.pl').
dirDepth(1,0).
dirDepth(DId,X) :- directory(DId,_,PId,_,_), dirDepth(PId,Y), X is Y + 1.

% Aufgabe 4
?- consult('skigebiet.pl').
% 4.1
ist_erreichbar_rek(X,X,0).
ist_erreichbar_rek(Start,Ziel,Acc,Return) :-
  strecke(_,Start,Ziel,_,Laenge), Return is Acc + Laenge.
ist_erreichbar_rek(Start,Ziel,Acc,Return) :-
  strecke(_,Start,ZielX,_,Laenge),
  NewAcc is Acc + Laenge,
  ist_erreichbar_rek(ZielX,Ziel,NewAcc,Return).
ist_erreichbar(Start,Ziel,Return) :-
  ist_erreichbar_rek(Start,Ziel,0,Return).

% 4.2
% TODO

% Aufgabe 5
% TODO
