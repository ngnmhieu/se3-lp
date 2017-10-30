
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
?- mutter_von(barbara,X);vater_von(barbara,X).
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

%i)
?- \+ \+ vater_von(johannes,X).
%true.

%Aufgabe 2.2
% Wir gehen nicht vom Geschlecht von Charlotte aus, d.h. Charlotte kann sowohl Vater als auch Mutter sein.
?- (mutter_von(charlotte,X); vater_von(charlotte,X)), (mutter_von(X,Y); vater_von(X,Y)).

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
/*
?- trace.

[trace]  ?- vater_von(walter,magdalena).
   Call: (8) vater_von(walter, magdalena) ? creep
   Exit: (8) vater_von(walter, magdalena) ? creep
true.

[trace]  ?- mutter_von(julia,hans).
   Call: (8) mutter_von(julia, hans) ? creep
   Fail: (8) mutter_von(julia, hans) ? creep
false.

[trace]  ?- mutter_von(X,andrea).
   Call: (8) mutter_von(_10130, andrea) ? creep
   Exit: (8) mutter_von(barbara, andrea) ? creep
X = barbara.

[trace]  ?- vater_von(X,walter).
   Call: (8) vater_von(_9890, walter) ? creep
   Fail: (8) vater_von(_9890, walter) ? creep
false.

[trace]  ?- mutter_von(barbara,X);vater_von(barbara,X).
   Call: (9) mutter_von(barbara, _9676) ? creep
   Exit: (9) mutter_von(barbara, klaus) ? creep
X = klaus ;
   Redo: (9) mutter_von(barbara, _9676) ? creep
   Exit: (9) mutter_von(barbara, andrea) ? creep
X = andrea ;
   Call: (9) vater_von(barbara, _9676) ? creep
   Fail: (9) vater_von(barbara, _9676) ? creep
false.

[trace]  ?- mutter_von(Y,X).
   Call: (8) mutter_von(_9866, _9868) ? creep
   Exit: (8) mutter_von(marie, hans) ? creep
Y = marie,
X = hans ;
   Redo: (8) mutter_von(_9866, _9868) ? creep
   Exit: (8) mutter_von(marie, helga) ? creep
Y = marie,
X = helga ;
   Redo: (8) mutter_von(_9866, _9868) ? creep
   Exit: (8) mutter_von(julia, otto) ? creep
Y = julia,
X = otto ;
   Redo: (8) mutter_von(_9866, _9868) ? creep
   Exit: (8) mutter_von(barbara, klaus) ? creep
Y = barbara,
X = klaus ;
   Redo: (8) mutter_von(_9866, _9868) ? creep
   Exit: (8) mutter_von(barbara, andrea) ? creep
Y = barbara,
X = andrea ;
   Redo: (8) mutter_von(_9866, _9868) ? creep
   Exit: (8) mutter_von(charlotte, barbara) ? creep
Y = charlotte,
X = barbara ;
   Redo: (8) mutter_von(_9866, _9868) ? creep
   Exit: (8) mutter_von(charlotte, magdalena) ? creep
Y = charlotte,
X = magdalena.

[trace]  ?- vater_von(Y,X).
   Call: (8) vater_von(_9918, _9920) ? creep
   Exit: (8) vater_von(test3, test4) ? creep
Y = test3,
X = test4 ;
   Redo: (8) vater_von(_9918, _9920) ? creep
   Exit: (8) vater_von(otto, hans) ? creep
Y = otto,
X = hans ;
   Redo: (8) vater_von(_9918, _9920) ? creep
   Exit: (8) vater_von(otto, helga) ? creep
Y = otto,
X = helga ;
   Redo: (8) vater_von(_9918, _9920) ? creep
   Exit: (8) vater_von(gerd, otto) ? creep
Y = gerd,
X = otto ;
   Redo: (8) vater_von(_9918, _9920) ? creep
   Exit: (8) vater_von(johannes, klaus) ? creep
Y = johannes,
X = klaus ;
   Redo: (8) vater_von(_9918, _9920) ? creep
   Exit: (8) vater_von(johannes, andrea) ? creep
Y = johannes,
X = andrea ;
   Redo: (8) vater_von(_9918, _9920) ? creep
   Exit: (8) vater_von(walter, barbara) ? creep
Y = walter,
X = barbara ;
   Redo: (8) vater_von(_9918, _9920) ? creep
   Exit: (8) vater_von(walter, magdalena) ? creep
Y = walter,
X = magdalena ;
   Redo: (8) vater_von(_9918, _9920) ? creep
   Exit: (8) vater_von(test1, test2) ? creep
Y = test1,
X = test2 ;
   Redo: (8) vater_von(_9918, _9920) ? creep
   Exit: (8) vater_von(test5, test6) ? creep
Y = test5,
X = test6.

[trace]  ?- \+ mutter_von(magdalena,X).
   Call: (9) mutter_von(magdalena, _9938) ? creep
   Fail: (9) mutter_von(magdalena, _9938) ? creep
true.

[trace]  ?- \+ vater_von(otto,X).
   Call: (9) vater_von(otto, _9898) ? creep
   Exit: (9) vater_von(otto, hans) ? creep
false.

[trace]  ?- \+ \+ vater_von(johannes,X).
   Call: (9) vater_von(johannes, _9944) ? creep
   Exit: (9) vater_von(johannes, klaus) ? creep
true.

In einer Trace-Zeile werden folgende Informationen ausgegeben: Name von dem "Port" (Call, Exit, Redo, Fail ...), das als spy-points dient. Die Zahl in Klammern ist die Tiefe von der Rekursion. Dannach ist das Ziel des Prädikats. Die Syntax der Systemausgabe ist anders als die im Skript (im Skript werden weniger Informationen gezeigt) aber der Inhalt ist im Grunde gleich.
*/
