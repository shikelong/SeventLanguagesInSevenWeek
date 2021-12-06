min([], null).
min([H], H).
min([H|T], M) :- min(T, M), M =< H. 