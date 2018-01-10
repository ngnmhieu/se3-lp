?- consult('dax2016.pl').
% ?- consult('dax2017.pl').
?- consult('display_pi.pl').

% Aufgabe 1

to_timestamp([Day,Month,Year],Timestamp) :-
  string_concat(Year,'-',Year_),
  string_concat(Year_,Month,Year_Month),
  string_concat(Year_Month,'-',Year_Month_),
  string_concat(Year_Month_,Day,Year_Month_Day),
  parse_time(Year_Month_Day, 'iso_8601', Timestamp).
string_to_timestamp(DatumStr,Timestamp) :-
  split_string(DatumStr, ".", "", DatumTeile),
  to_timestamp(DatumTeile,Timestamp).
dax_with_real_date(Datum, X1, X2, Timestamp) :- dax(Datum,X1,X2), string_to_timestamp(Datum,Timestamp).

sort_dax(DAX) :-
  findall((Timestamp, X1, X2), dax_with_real_date(Datum, X1, X2, Timestamp), List),
  sort(1, @<, List, DAX).

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

% Aufgabe 2
