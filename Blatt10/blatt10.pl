?- consult('dax2016.pl').
% ?- consult('dax2017.pl').
?- consult('display_pi.pl').

% TODO: sort nicht nach string sondern nach echte datum
sort_dax(DAX) :- findall((Datum, X1, X2), dax(Datum, X1, X2), List), sort(1, @<, List, DAX).

get_eroeffnung((_,X1,_),NeuX1) :- NeuX1 is X1 / 500 - 7.
get_schluss((_,_,X2),NeuX2) :- NeuX2 is X2 / 500 - 7.

zip([], [], []).
zip([X|Xs], [Y|Ys], [X,Y|Zs]) :- zip(Xs,Ys,Zs).

draw_dax(DAX_Daten) :-
  sort_dax(DAX),
  maplist(get_eroeffnung,DAX,DAX_Eroeffnung),
  maplist(get_schluss,DAX,DAX_Schluss),
  zip(DAX_Eroeffnung, DAX_Schluss, DAX_Daten),
  display('Zeitreihe', DAX_Daten).
