%Aufgabe 1.1
?- consult('familie.pl').
%true.

/*
Die Hochkommata sind zu setzen, damit das Prolog System den Dateipfad auch als Dateipfad ansieht und nicht nach einer Datei mit diesem Namen sucht.
*/

%Aufgabe 1.2
?- listing([mutter_von, vater_von]).

/*
:- dynamic mutter_von/2.

mutter_von(marie, hans).
mutter_von(marie, helga).
mutter_von(julia, otto).
mutter_von(barbara, klaus).
mutter_von(barbara, andrea).
mutter_von(charlotte, barbara).
mutter_von(charlotte, magdalena).

:- dynamic vater_von/2.

vater_von(otto, hans).
vater_von(otto, helga).
vater_von(gerd, otto).
vater_von(johannes, klaus).
vater_von(johannes, andrea).
vater_von(walter, barbara).
vater_von(walter, magdalena).

true.
*/

%Aufgabe 1.3
?- assert(vater_von(test1, test2)).
%true.

?- asserta(vater_von(test3, test4)).
%true.

?- assertz(vater_von(test5, test6)).
%true.

?- listing(vater_von).
/*
:- dynamic vater_von/2.

vater_von(test3, test4).
vater_von(otto, hans).
vater_von(otto, helga).
vater_von(gerd, otto).
vater_von(johannes, klaus).
vater_von(johannes, andrea).
vater_von(walter, barbara).
vater_von(walter, magdalena).
vater_von(test1, test2).
vater_von(test5, test6).

true.
*/

/*
assert/1 fügt eine Klausel der Datenbank hinten wie assertz/1 an.
asserta/1 fügt eine Klausel an erster Stelle der Datenbank hinzu.
assertz/1 fügt eine Klausel an letzter Stelle der Datenbank hinzu.
*/

%Aufgabe 2.1

%a)
?- vater_von(walter,magdalena).
%true.

%b)
?- mutter_von(julia,hans).
%false.

%c)
?- mutter_von(X,andrea).
%X = barbara.

%d)
?- vater_von(X,walter).
%false. ==> In der Datenbank ist kein Vater für Walter eingetragen!

%e)
?- mutter_von(barbara,X).
%X = klaus 
%X = andrea.

%f)
?- mutter_von(Y,X).
/*
Y = marie,
X = hans 
Y = marie,
X = helga 
Y = julia,
X = otto 
Y = barbara,
X = klaus 
Y = barbara,
X = andrea 
Y = charlotte,
X = barbara 
Y = charlotte,
X = magdalena.
*/

?- vater_von(Y,X).
/*
Y = otto,
X = hans 
Y = otto,
X = helga 
Y = gerd,
X = otto 
Y = johannes,
X = klaus 
Y = johannes,
X = andrea 
Y = walter,
X = barbara 
Y = walter,
X = magdalena.
*/

%g)
?- \+ mutter_von(magdalena,X).
%true.

%h)
?- \+ vater_von(otto,X).
%false. 

%Aufgabe 2.2
?- mutter_von(charlotte, X), mutter_von(X,Y).
/*
X = barbara,
Y = klaus 
X = barbara,
Y = andrea 
false.
Es wird false zurückgegeben, weil Magdalena auch eine Tochter von Charlotte ist, aber keine Kinder hat. Es werden also nur die Kinder von Barbara ausgegeben welche die Enkelkinder von Charlotte sind.
*/

%Aufgabe 2.3






