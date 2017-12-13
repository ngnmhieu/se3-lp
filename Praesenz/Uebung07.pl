% Es gibt zwei Möglichkeiten eine Liste darzustellen
% [a, b, c] is äquivalent zu [a | [b,c]] oder [a, b | [c]] oder [a, b, c | []] oder [a | [b | [c | []]]]
%

% Test
%
% ?- member(X,[a,b,c])
% X=a; X=b; X=c
%
% ?- append([a|b], [c], L).
% false
% => [a|b] ist keine Liste, es muss entweder [a,b] oder [a | [b]] sein.
%
% ?- append(_,L,[a,b])
% L=[]; L[b]; L[a,b]
%
% ?- last(L,c)
% L=[c];
% L=[_,c];
% L=[_,_,c];
