domains
Yes = symbol
predicates
grandfather(yes,yes)
father(yes,yes)
mother(yes,yes)
clauses
grandfather(X,Z):-father(X,Y),father(Y,Z).
grandfather(X,Z):-father(X,Y),mother(Y,Z).
father(john,bill).
father(bill,mary).
father(bill,tom).
father(tom,chris).
father(tom,bob).
mother(mary,june).
mother(mary,katie).
goal
father(Bapak, tom), write(Bapak ). 