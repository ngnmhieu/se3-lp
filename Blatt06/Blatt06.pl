%Aufgabe 1.1
%zins(+Anlagebetrag,+Zinsfaktor,+Anlagedauer,?Endguthaben)

zins(Anlagebetrag,_,0,Anlagebetrag).
zins(Anlagebetrag,Zinsfaktor,Anlagedauer,Endguthaben) :-
        Anlage is ((Zinsfaktor +1) * Anlagebetrag),
        Dauer is Anlagedauer - 1,
        zins(Anlage,Zinsfaktor,Dauer,Endguthaben).
        
%test: 
%?- zins(1000,0.05,2,X).
%X = 1102.5 


%Aufgabe 1.2
%zinsOhneRek(+Anlagebetrag,+Zinsfaktor,+Anlagedauer,?Endguthaben)

zinsOhneRek(Anlagebetrag,_,0,Anlagebetrag).
zinsOhneRek(Anlagebetrag,Zinsfaktor,Anlagedauer,Endguthaben) :-
        Endguthaben is (Zinsfaktor * Anlagebetrag * Anlagedauer) + Anlagebetrag.
        
%test:
%?- zinsOhneRek(1000,0.05,2,X).
%X = 1100.0.



%Aufgabe 1.3
%Aufgabe 1.1 ist bereits Endrekursiv gelöst.

%Aufgabe 1.4
%zuwachsZins(+Anlagebetrag,+Bonuszins,+Basiszinz,+Anlagedauer,?Endguthaben)

zuwachsZins(Anlagebetrag,_,_,0,Anlagebetrag).
zuwachsZins(Anlagebetrag,Bonuszins,Basiszinz,Anlagedauer,Endguthaben) :-
        Bonus is (Bonuszins / 2),
        Zins is Basiszinz + Bonus,
        Anlage is (1+ Zins) * Anlagebetrag,
        Dauer is Anlagedauer - 1,
        zuwachsZins(Anlage, Bonus, Zins, Dauer, Endguthaben).
        
%test:

%?- zuwachsZins(1000,0.04,0.01,2,X).
%X = 1071.2.

%?- zuwachsZins(1000,0.04,0.01,2,1071.2).
%true. 
        
% Aufgabe 1.5
%
%Das Modell mit dem festen Zinssatz eignet sich für 1 - 4 Jahre.
%Ab dem 4. Jahr eignet sich der variable Zinssatz mehr, da man dort mehr Zinsen / Jahr macht.









%Aufgabe 4.1
%over(n, k, Result)

over(_,0,1).
over(K,K,1).

over(N,K,Result) :-
        N1 is (N - 1),
        K1 is (K - 1),
        over(N1,K1,SumA),
        over(N1,K,SumB),
        Result is SumA + SumB.
