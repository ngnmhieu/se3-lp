% Praesenzaufgabe 2 

% Fakt: ist eine Aussage z.B. mutter_von_(gabrieler, hans)., was in der Datenbank steht
% 
% Praedikat: ist nicht Faktensammlung, es ist nur lediglich aus Praedikatnamen und Stelligkeit
% (z.B. mutter_von/2)
% 
% Ziel: mutter_von(X,Y) oder Anfrage / Goal.
%
% Regel: elternteil(X) :- mutter_von(X,_) 
%
% Struktur: Besteht aus einem Namen und mindestens einem Argument.
%
% Variable: ist eine unspezifizierte Fakt und wird in Prolog großgeschrieben
%
% Suche: dabei geht die Datenbank durch alle Fakten und versucht Belegungen fuer die Variablen
% in dem Ziel / der Anfrage zu finden.

% Aufgabe 1. Graphen malen und die Eigenschaften von denen erläutern
% - gerichtet / ungerichtet
% - zyklisch / azyklisch
% - in / out degree
% - unzusammenhängend / schwach / stark zusammenhängend
% - Baum balanciert / unbalanciert 
% - Verzweigungsfaktor vom Baum
