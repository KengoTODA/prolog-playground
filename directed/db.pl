% working_directory(CWD,'/Users/kengo/GitHub/prolog-playground/directed').

edge(a, b). edge(a, c). edge(b, c). edge(c, f). edge(d, e).

connected(A, B) :- edge(A, B); edge(B, A).

sources(Destination, List) :-
    findall(Source, edge(Source, Destination), List).

destinations(Source, List) :-
    findall(Destination, edge(Source, Destination), List).

reachable(A, B) :- edge(A, B).
reachable(A, B) :- edge(A, C), reachable(C, B).

neighbors(A, Set) :-
    findall(B, connected(A, B), Set).

go(From, To, Seen, Path) :-
    connected(From, Between),
    Between \== To,
    \+member(Between, Seen),
    go(Between, To, [Between|Seen], Path).

path(From, To, Path) :-
    go(From, To, [From], Result),
    reverse(Path, Result).

path_with_length(From, To, Path, Length) :-
    path(From, To, Path),
    length(Path, Length).
