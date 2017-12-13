% Es gibt zwei Möglichkeiten eine Liste darzustellen
% [a, b, c] is äquivalent zu [a | [b,c]] oder [a, b | [c]] oder [a, b, c | []] oder [a | [b | [c | []]]]
% 
% Test Fragen
% 
% ?- member(X,[a,b,c])
%   X=a; X=b; X=c
% 
%   ?- append([a|b], [c], L).
%   false
%   => [a|b] ist keine Liste, es muss entweder [a,b] oder [a | [b]] sein.
% 
% ?- append(_,L,[a,b])
%   L=[]; L[b]; L[a,b]
% 
% ?- last(L,c)
%   L=[c];
%   L=[_,c];
%   L=[_,_,c];
%
% Präsenzaufgaben
%
% Mögliche Datenstruktur für die Hash-Tabelle:
%
% 1. Liste von Liste, die als Buckets gesehen sind. Die Elemente sind Key-Value Paare.
% [
%   [[K,V], [K,V], [K,V], ...],
%   [[K,V], [K,V], [K,V], ...],
%   [[K,V], [K,V], [K,V], ...]
% ]

% Rekursive Version
% getht(+N,?Table).
getht(0, []).
getht(N, [[] | T]) :-
  N > 0,
  N1 is N-1,
  getht(N1, T)

% Nicht-Rekursive Version
getht1(N, Table) :-
  findall(B, (between(1,N,_), b=[]), Table).

%
% 2. Mit Prädikaten:
% ht/n - Hash-Tabelle mit n Buckets
% ht(
%   [e(K,V), e(K,V), ...],
%   [e(K,V), e(K,V), ...],
%   [e(K,V), e(K,V), ...]
% )

getht2(N,Table) :-
  functor(Table,ht,N),
  foreach(between(1,N,P), setarg(P,Table,[])) % setarg befüllt Argumente P und Table mit dem 3. Argument

