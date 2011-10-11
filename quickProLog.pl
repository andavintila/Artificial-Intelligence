% quick ProLog excercises; @author Andrei Olaru

p(a). % litera mica -> simbol constant
p(b). % orice declaratie sau interogare se termina cu .
p(c).
p(5).

% la consola: incearca p(a). incearca p(x). incearca p(X). Foloseste ;
% pentru defilarea rezultatelor si . pentru terminarea interogarii


q(X) :- X > 0. % conditie

% la consola: incearca q(1). incearca q(X). observa eroarea.

% decomenteaza una dintre definitii si incearca la consola r(X).
r(5).
%r(X) :- r(Y), Y < 10, X is Y + 1.
%r(X) :- r(Y), X = Y + 1.
%r(X) :- r(Y), X =:= Y + 1. % ce se intampla? de ce?
%r(X) :- r(Y), r(X), X =:= Y + 1.  % ce se intampla? de ce?

% decomenteaza definitiile predicatului lungime(+Lista, -Lungime) :
% lungime([], 0). % caz initial
% lungime([Element | RestLista], Lungime) :- lungime(RestLista,
% LungimeRest), Lungime is LungimeRest + 1. % pas de inductie; vezi
% Element singleton variable; inlocuieste cu _

% incearca:
% lungime([a,b,5], L).
% lungime([a,b,[5,6]], L).
% lungime([a,b,p(x)], L).
% lungime([a,b | x, y], L). % observa eroarea
% lungime([a,b | [x, y]], L).
% lungime([a,b | [x, y]], 4).
% lungime([a,b | [x, y]], 5).


% structura stare(x, y, z)

doStare(St) :- stare(X,Y,Z) = St, write('stare '), printLista([X,Y,Z]).
doStare([X, Y, Z]) :- St = stare(X, Y, Z), write('lista '), printLista([St]).
doStare(X, Y, Z) :- St = stare(X, Y, Z), write('elemente '), printLista([St]).

printLista([]).
printLista([St | R]) :- format('~w ~n', [St]), printLista(R).

imparte([],[],[]).
imparte([X],P,I) :- imparte([],P,IN), I=[X|IN].
imparte([X,Y|R],P,I) :- imparte(R,PN,IN), P=[Y|PN], I=[X|IN].

interclasare([],[],[]).
interclasare([X],[],Rez):- interclasare([],[],RezN), Rez=[X|RezN].
interclasare([],[X],Rez):- interclasare([],[],RezN), Rez=[X|RezN].
interclasare([X1|L1],[X2|L2],Rez):- X1 < X2, interclasare(L1,[X2|L2],RezN), Rez = [X1|RezN].
interclasare([X1|L1],[X2|L2],Rez):- X1 > X2, interclasare([X1|L1],L2,RezN), Rez = [X2|RezN].
interclasare([X1|L1],[X2|L2],Rez):- X1 = X2, interclasare(L1,L2,RezN), Rez = [X1|RezN].

sterge(_, [],[]).
sterge(X,[Y|L],Rez):- X=Y,sterge(X,L,RezN), Rez=RezN.
sterge(X,[Y|L],Rez):- X\=Y,sterge(X,L,RezN), Rez=[Y|RezN].

member(_,[]):-false.
member(X,[Y|_]):- X=Y.
member(X,[Y|L]):- X\=Y, member(X,L).

eliminaDuplicate([],[]).
eliminaDuplicate([X|L],Rez):-member(X,L), eliminaDuplicate(L,RezN), Rez = RezN.
eliminaDuplicate([X|L],Rez) :- \+ member(X,L), eliminaDuplicate(L,RezN), Rez = [X|RezN].







