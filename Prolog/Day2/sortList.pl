msort([], []).
msort([A], [A]).
msort([A, B|Tail], Sorted) :-
    split([A, B|Tail], L1, L2),
    msort(L1, Sorted1),
    msort(L2, Sorted2),
    merge(Sorted1, Sorted2, Sorted).


merge([], L, L).
merge(L, [], L).
merge([H1|T1], [H2|T2], [H1|T]) :-
    H1 =< H2,
    merge(T1, [H2|T2], T).
merge([H1|T1], [H2|T2], [H2|T]) :-
    H1 > H2,
    merge([H1|T1], T2, T).


split([], [], []).
split([A], [A], []).
split([A, B|C], [A|D], [B|E]) :-
    split(C, D, E).

  