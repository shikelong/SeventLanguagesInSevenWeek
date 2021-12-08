% this version remove row.
:- use_module(library(clpfd)).
:- set_prolog_flag(answer_write_options, [max_depth(0)]).


valid_queue((_, Col)) :-
    member(Col, [1, 2, 3, 4, 5, 6, 7, 8]).

valid_board([]).
valid_board([H|T]) :-
    valid_queen(H),
    valid_board(T).


cols([], []).
cols([(_, H)|T], [H|R]) :-
    cols(T, R).

diags1([], []).
diags1([(R, C)|T], [Diagonal|DiagonalsTail]) :-
    Diagonal is C-R,
    diags1(T, DiagonalsTail).

diags2([], []).
diags2([(R, C)|T], [Diagonal|DiagonalsTail]) :-
    Diagonal is R+C,
    diags2(T, DiagonalsTail).


eight_queens(Board) :-
    Board=[(1, _),  (2, _),  (3, _),  (4, _),  (5, _),  (6, _),  (7, _),  (8, _)],
    valid_board(Board),
    cols(Board, Cols),
    diags1(Board, Diags1),
    diags2(Board, Diags2),
    all_different(Cols),
    all_different(Diags1),
    all_different(Diags2).


%eight_queens([(1,A), (2,B), (3,C), (4,D), (5,E), (6,F), (7,G),(8,H)]).