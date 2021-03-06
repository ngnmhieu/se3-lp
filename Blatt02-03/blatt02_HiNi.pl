% Blatt02
% Nico Hahn 6990715
% Hieu Nguyen 6632126

% Aufgabe 2
?- consult('haeuser.pl').

% 2.1 Welche Haeuser stehen in der Bahnhofsstrasse?
bahnHofHaeuser(ObjNr, HausNr) :-
  obj(ObjNr,_,bahnhofsstr,HausNr,_).
% Ausgabe: 
%  ObjNr = 2,
%  HausNr = 27,
%  ObjNr = 3,
%  HausNr = 29,
%  ObjNr = 4,
%  HausNr = 28,
%  ObjNr = 5,
%  HausNr = 30,
%  ObjNr = 6,
%  HausNr = 26,

% 2.2 Welche Haeuser wurden vor 1950 gebaut?
altBau(ObjNr,StrName,HausNr,BauJahr) :-
  obj(ObjNr,_,StrName,HausNr,BauJahr),
  BauJahr < 1950.

% Ausgabe: 
%  ObjNr = 2,
%  StrName = bahnhofsstr,
%  HausNr = 27,
%  BauJahr = 1943 ;
%  ObjNr = 5,
%  StrName = bahnhofsstr,
%  HausNr = 30,
%  BauJahr = 1901 ;
%  false.

% 2.3 Wer besitzt Haeuser, die mehr als 300.000 Euro wert sind?
teuerHausBesitzer(Besitzer, Preis) :-
  bew(_,ID,_,Besitzer,Preis,D1), Preis > 300000,
  not((bew(,ID,_,_,_,D2), D2 > D1)). % das Haus darf auch nicht weiterverkauft sein 

% Ausgabe:
%  Besitzer = mueller,
%  Preis = 315000 ;
%  Besitzer = piepenbrink,
%  Preis = 1500000.

% 2.4 Welche Haeuser wurden mit Gewinn weiterverkauft

gewinnVerkauft(ObjNr, StrName, HausNr) :-
  obj(ObjNr,_,StrName,HausNr,_),
  bew(_,ObjNr,_,Kaeufer,KaufPreis,_),
  bew(_,ObjNr,Kaeufer,_,VerkaufPreis,_),
  VerkaufPreis > KaufPreis.

% Ausgabe:
%  ObjNr = 3,
%  StrName = bahnhofsstr,
%  HausNr = 29 ;
%  ObjNr = 3,
%  StrName = bahnhofsstr,
%  HausNr = 29 ;
%  false.

% 2.5 Welche Haeuser haben schon mehrfach den Besitzer gewechselt

mehrGekauft(ObjNr, StrName, HausNr) :- bew(_,ObjNr,_,Besitzer1,_,_),
                   bew(_,ObjNr,_,Besitzer2,_,_),
                   Besitzer1 \= Besitzer2,
                   obj(ObjNr,_, StrName, HausNr, _).
% Ausgabe:
%  ObjNr = 3,
%  StrName = bahnhofsstr ;
%  ObjNr = 3,
%  StrName = bahnhofsstr ;
%  false.

% 2.6
% Hilfspraedikat
bes(Kaeufer, HausId) :- bew(_,HausId,_,Kaeufer,_,_),
                        not(bew(_,HausId,_,_,_,D2), D2 > D1).
besitztMehrHaeuser :- bes(X, A), bes(X, B), A /= B.

% alternativ
mehrHaeuser :- bew (_,_,_,K,_,_), setof(X,bes(K,X),L), length(L,N), N >= 2.

% Aufgabe 3
?- consult('dateiverzeichnis.pl').

% 3.1 Umrechnen zwischen Dateinamen und Dateischluessel
% fNameToFId(?FId,?FName)
fNameToFId(FId,FName) :- file(FId,_,FName,_,_,_).

% 3.2 Umrechnen zwischen Verzeichnisnamen und Verzeichnisschluessel
% dNameToDId(?DId,?DName)
dNameToDId(DId,DName) :- directory(DId,DName,_,_,_).

% 3.3 Name und Schluessel des zugehörigen Verzeichnises der Datei
% fileToDir(+FileName, -DirId, -DirName)
fileToDir(FileName, DirId, DirName) :-
  file(_,DirId,FileName,_,_,_),
  directory(DirId,DirName,_,_,_).

% 3.4 Name und Schluessel des übergeordnetes Verzeichnises
% parentDir(+DirName, -ParentId, -ParentName)
parentDir(DirName, ParentId, ParentName) :-
  directory(_,DirName,ParentId,_,_),
  directory(ParentId,ParentName,_,_,_).

% 4.1 Dateinamen
% listFile(+DirId, -FileList)
listFile(DirId, FileList) :- findall(FileName,file(_,DirId,FileName,_,_,_),FileList).

% 4.2 Namen aller Unterverzeichnisse
% listSubdir(+ParentDirId, -DirList)
listSubdir(ParentDirId, DirList) :- findall(SubDir,directory(_,SubDir,ParentDirId,_,_),DirList).

% 4.3 Anzahl aller Datein in einem bestimmten Verzeichnis
% countFiles(+DirId, -Count) 
countFiles(DirId, Count) :- listFile(DirId, FileList), length(FileList,Count).
