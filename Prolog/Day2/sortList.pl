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

% split([1,2,3,4], A, B) -->
% A ~ 1. B ~ 2, C ~ [3,4]   / [1,D] / [2,E]
% split([3,4], D, E) -->
% A ~ 3, B ~ 4, C ~ [] / [3, D] / [4, E]
% split([], D, E) --> D ~ [], E ~ []
% 回溯: [3, []] / [4, []]
% D ~ [3,], E ~ [4]
% D ~ [1, 3], E ~ [2,4]

