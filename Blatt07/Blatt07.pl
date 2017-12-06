% Aufgabe 1.1
% Gibt eine Liste der Verzeichnisnamen auf dem Zugriffspfad zurueck
% zugriffspfad(+DirId, -Zugriffspfad)
?- consult('dateiverzeichnis.pl').
zugriffspfad(0, []).
zugriffspfad(DirId, ZP) :-
  directory(DirId,DirName,PId,_,_),
  zugriffspfad(PId, ParentZP),
  append(ParentZP, [DirName], ZP).

% Aufgabe 1.2
zugriffspfad_datei(FName, ZP) :-
  file(_,DirId,FName,_,_,_),
  zugriffspfad(DirId, DirZP),
  append(DirZP, [FName], ZP).

% Aufgabe 1.3

% Aufgabe 2.1

% Aufgabe 2.2

% Aufgabe 2.3

% Aufgabe 3.1

% Aufgabe 3.2

% Aufgabe 3.3

% Aufgabe 3.4

% Aufgabe 3.5
