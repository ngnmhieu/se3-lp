% Blatt02
% Nico Hahn 6990715
% Hieu Nguyen 6632126

% Aufgabe 2
?- consult('haeuser.pl').

% Aufgabe 2.1

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

% Aufgabe 2.2

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

% Aufgabe 2.3

% ?- bew(_,_,_,Besitzer,Preis,_),Preis > 300000.
% Besitzer = mueller,
% Preis = 315000 ;
% Besitzer = piepenbrink,
% Preis = 1500000.

% Aufgabe 2.4

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

% Aufgabe 2.5

bagof(ObjNr,bew(_,ObjNr,_,Besitzer1,_,_), bew(_,ObjNr,_,Besitzer2,_,_), Besitzer1 \= Besitzer2).
