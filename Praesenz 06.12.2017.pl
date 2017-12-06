last([E],E).
last([_|L],E) :- last (L,E).

last1(L,E) :- rev(L,[E|_]).

rev([],[]).
rev([E|L],L2) :- rev(L,L1), app(L1,[E], L2).

app([],[],[]).
app([A|As],B,[A|C]) :- app(As,B,C).


is_set([])
is_set([E|L]) :- not(mem(L,E)), is_set(L).

mem([E|_],E).
mem([_|L],E) :- mem(L,E).

is_set1(L) :- setof(M,mem(L,M),X),
    length(X,A), length(L,A).


splice(L,[],L).
splice([],L,L).
splice([A|As],[B|Bs],[A,B|Cs]) :- splice(As,Bs,Cs).
