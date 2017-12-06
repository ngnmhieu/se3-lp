% Aufgabe 1.1
% Gibt eine Liste der Verzeichnisnamen auf dem Zugriffspfad zurueck
% zugriffspfad(+DirId, -Zugriffspfad)
?- consult('dateiverzeichnis.pl').
zugriffspfad_rek(0, Acc, Acc).
zugriffspfad_rek(DirId, Acc, ZP) :-
  directory(DirId,DirName,PId,_,_),
  append(Acc, [DirName], NeuAcc),
  zugriffspfad_rek(PId, NeuAcc, ZP).
zugriffspfad(DirId, ZP) :- zugriffspfad_rek(DirId, [], ZP).

% Aufgabe 1.2

% Aufgabe 1.3

% Aufgabe 2.1

% Aufgabe 2.2

% Aufgabe 2.3

% Aufgabe 3.1

% Aufgabe 3.2

% Aufgabe 3.3

% Aufgabe 3.4

% Aufgabe 3.5
