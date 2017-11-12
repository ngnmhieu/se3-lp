% Blatt02
% Nico Hahn 6990715
% Hieu Nguyen 6632126

% Aufgabe 2
?- consult('haeuser.pl').

% 2.1

% ?- obj(ObjNr,ObjTyp,bahnhofsstr,HausNr,BauJahr).
% ObjNr = 2,
% ObjTyp = efh,
% HausNr = 27,
% BauJahr = 1943 ;
% ObjNr = 3,
% ObjTyp = efh,
% HausNr = 29,
% BauJahr = 1997 ;
% ObjNr = 4,
% ObjTyp = mfh,
% HausNr = 28,
% BauJahr = 1989 ;
% ObjNr = 5,
% ObjTyp = bahnhof,
% HausNr = 30,
% BauJahr = 1901 ;
% ObjNr = 6,
% ObjTyp = kaufhaus,
% HausNr = 26,
% BauJahr = 1997.

% 2.2

% ?- obj(ObjNr,ObjTyp,StrName,HausNr,BauJahr), BauJahr < 1950.
% ObjNr = 2,
% ObjTyp = efh,
% StrName = bahnhofsstr,
% HausNr = 27,
% BauJahr = 1943 ;
% ObjNr = 5,
% ObjTyp = bahnhof,
% StrName = bahnhofsstr,
% HausNr = 30,
% BauJahr = 1901 ;
% false.

% 2.3

% ?- bew(_,_,_,Besitzer,Preis,_),Preis > 300000.
% Besitzer = mueller,
% Preis = 315000 ;
% Besitzer = piepenbrink,
% Preis = 1500000.

% 2.4

% ?- obj(ObjNr,ObjTyp,StrName,HausNr,BauJahr),
%    bew(_,ObjNr,_,Kaeufer,KaufPreis,_),
%    bew(_,ObjNr,Kaeufer,_,VerkaufPreis,_),
%    VerkaufPreis > KaufPreis.
% ObjNr = 3,
% ObjTyp = efh,
% StrName = bahnhofsstr,
% HausNr = 29,
% BauJahr = 1997,
% Kaeufer = schneider,
% KaufPreis = 260000,
% VerkaufPreis = 315000 ;
% false.

% 2.5
% TODO
% bagof(ObjNr,bew(_,ObjNr,_,Besitzer1,_,_), bew(_,ObjNr,_,Besitzer2,_,_), Besitzer1 \= Besitzer2).

% 2.6
% TODO

% Aufgabe 3
?- consult('dateiverzeichnis.pl').

% 3.1
fNameToFId(FId,FName) :- file(FId,_,FName,_,_,_).

% 3.2
dNameToDId(DId,DName) :- directory(DId,DName,_,_,_).

% 3.3
fileToDir(FileName, DirId, DirName) :- file(_,DirId,FileName,_,_,_),
                                       directory(DirId,DirName,_,_,_).

% 3.4
parentDir(DirName, ParentId, ParentName) :- directory(_,DirName,ParentId,_,_),
																						directory(ParentId,ParentName,_,_,_).

% 4.1

% 4.2

% 4.3
