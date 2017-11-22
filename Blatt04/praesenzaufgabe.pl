% Aufgabe 1
% Was ist PEANO-Zahlen?
%   PEANO-Zahl wird definiert mit Hilfe 5. Axiomen - siehe Folien
%   Kurz gesagt, es gibt eine Zahl 0 die kleinste ist
%   Für jede Zahl n in N, gibt es eine eindeutige Nachfolge s(n) auch in N.
% Wie lassen sich PEANO-Zahlen als Prolog-Strukturen darstellen?
%   Sie werden mit rekursiven Strukturen in Prolog dargestellt:
%    0    -> 0
%    s(0) -> s(0)
%    s(1) -> s(s(0))
%    s(2) -> s(s(s(0)))
%    ....

% Definition von lt/2
% Pruefen Sie die Bedingung 3 < 2 mit lt/2
% Zu beachten ist 3 und 2 muss in PEANO-Format geschrieben werden.
lt(0,s(_)).
lt(s(X),s(Y)) :- lt(X,Y).

% ?- lt(s(s(s(0))), s(s(s(s(0)))))
% => true.

% Was ist die Berechnungsergebnis für die Anfgaen lt(0,X) und lt(X,Y).
% ?- lt(0,X)
% => X = s(_123435)
%
% ?- lt(X,Y)
%
% X = s(s(0)),
% Y = s(s(s(_8564))) ;
% X = s(s(s(0))),
% Y = s(s(s(s(_8572)))) ;
% X = s(s(s(s(0)))),
% Y = s(s(s(s(s(_8580))))) ;
% X = s(s(s(s(s(0))))),
% Y = s(s(s(s(s(s(_8588)))))) ;
% X = s(s(s(s(s(s(0)))))),
% Y = s(s(s(s(s(s(s(_8596))))))) ;
% X = s(s(s(s(s(s(s(0))))))),
% Y = s(s(s(s(s(s(s(s(_8604)))))))) ;
% X = s(s(s(s(s(s(s(s(0)))))))),
% Y = s(s(s(s(s(s(s(s(s(_8612))))))))) ;
% X = s(s(s(s(s(s(s(s(s(0))))))))),
% Y = s(s(s(s(s(s(s(s(s(s(...)))))))))) ;
% X = s(s(s(s(s(s(s(s(s(s(...)))))))))),
% Y = s(s(s(s(s(s(s(s(s(s(...)))))))))) .

% Definition von peano/1
peano(0).
peano(s(X)) :- peano(X).

% Definition von peano/2
% Peano ab eine Zahl
peano(L,L).
peano(L,s(X)) :- peano(L,X).

% Definition von peano/3
% Peano zwischen zwei Zahlen
peano(L,_,L).
peano(L,H,s(X)) :- lt(X,H),peano(L,H,X).

