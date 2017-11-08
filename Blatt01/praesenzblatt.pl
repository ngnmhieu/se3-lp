?- consult('familie.pl').

# 1. Eltern Paare
eltern(V,M) :- vater_von(V,K), mutter_von(M,K).

# nur Vater und Mutter werden gelistet und ohne duplikate
# findall((X,Y), (vater_von(X,_Z),mutter_von(Y,_Z)), List), list_to_set(List, Set).

# 2. Alle Geschwister Listen
geschwister(X, Y) :- (mutter_von(M, X), mutter_von(M, Y));
                     (vater_von(V, X), vater_von(V, Y)),
                     X \= Y.
# oder
# geschwister(X, Y) :- (mutter_von(M, X), mutter_von(M, Y)),
#                      X \= Y.
# geschwister(X, Y) :- (vater_von(V, X), vater_von(V, Y)),
#                      X \= Y.

# 3. Alle Eltern-Kinder Beziehungen
mutter_von(Y,X), vater_von(Z,X),
(mutter_von(Y,P); vater_von(Z,P)), X \= P.

# 4. Arten von Scheitern-Moeglichkeiten
# Unter spezifizierten Befehl (Fehlende Belegung bei der Auswertung).
# Division by zero
# Keine Fakten gefunden.
