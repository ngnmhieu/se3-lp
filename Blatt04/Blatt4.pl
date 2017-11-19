% Blatt02
% Nico Hahn 6990715
% Hieu Nguyen 6632126

% Aufgabe 2
?- consult('dateiverzeichnis.pl').

% 2.1 Zugriffpfad zwischen zwei Verzeichnissen
% zugriffpfad(?DirId1, ?DirId2)
con_sym(DId1, DId2) :- directory(DId1,_,DId2,_,_).
con_sym(DId1, DId2) :- directory(DId2,_,DId1,_,_).
zugriffpfad(DId1, DId2) :- con_sym(DId1,DId2).
zugriffpfad(DId1, DId2) :- con_sym(DId1,DId3), zugriffpfad(DId3, DId2).

% 2.2 Ueberpreuft, ob eine Datei vom Wurzelverzeichnis aus nicht mehr erreichbar ist
% nicht_zugreifbar(?FId)
wurzel_dir(DId) :- directory(DId,_,1,_,_).
wurzel_dir(DId) :- directory(DId,_,PId,_,_), wurzel_dir(PId).
wurzel_datei(FId) :- file(FId,DId,_,_,_,_), wurzel_dir(DId).
nicht_zugreifbar(FId) :- \+ wurzel_datei(FId).

% 2.3 Direkte und indirekte Unterverzeichnisse ermitteln
% uv(+DId,-UnterDId)
uv(DId,PId) :- directory(DId,_,PId,_,_).
uv(DId,PId) :- directory(DId,_,DId2,_,_), uv(DId2,PId).

% 2.4 Gesamtgröße aller Datein
% sumsize(+DId, -Size)
filesizes(DId, Size) :- file(_,DId,_,Size,_,_);
                        (uv(UnterDId,DId),file(_,UnterDId,_,Size,_,_)).
sumsize(DId, Size) :- findall(FSize,filesizes(DId,FSize),SizeList), sumlist(SizeList, Size).
