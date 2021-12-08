:- use_module(library(clpfd)).
:- set_prolog_flag(answer_write_options, [max_depth(0)]).

valid_queen((Row, Col)) :-
    Range=[1, 2, 3, 4, 5, 6, 7, 8],
    member(Row, Range),
    member(Col, Range).
    
valid_board([]).
valid_board([H|T]) :-
    valid_queen(H),
    valid_board(T).



rows([], []).
rows([(H, _)|T], [H|R]) :-
    rows(T, R).
%rows([(1,2), (2,3), (3,4)], A).   A = [1,2,3]
% H ~ 1, T ~ [(2,3), (3,4)], R ~ ?
% H ~ 2, T ~ [(3,4)], R ~ ?
% H ~ 3, T ~ [], R ~ ?
% [H|R] ==> [1|2|3|[]] ==> [1,2,3]
cols([], []).
cols([(_, H)|T], [H|R]) :-
    cols(T, R).

diags1([], []).
diags1([(R, C)|T], [Diagonal|DiagonalsTail]) :-
    Diagonal is C-R,
    diags1(T, DiagonalsTail).
%Process of diags1([(1,3), (2,7), (3,3), (4,8), (5,2), (6,5), (7,1), (8, 6)]).
% R ~ 1, C ~ 3, D ~ 2
% R ~ 2, C ~ 7, D ~ 5,
% R ~ 3, C ~ 3, D ~ 0,
% R ~ 4, C ~ 8, D ~ 4,
% R ~ 5, C ~ 2, D ~ -3,
% R ~ 6, C ~ 5, D ~ -1,
% R ~ 7, C ~ 1, D ~ -6,
% R ~ 8, C ~ 6, D ~ -2,
% R ~ [2,5,0,4,-3,-1,-6,-2]
diags2([], []).
diags2([(R, C)|T], [Diagonal|DiagonalsTail]) :-
    Diagonal is R+C,
    diags2(T, DiagonalsTail).

eight_queens(Board) :-
    length(Board, 8),
    valid_board(Board),
    rows(Board, Rows),
    cols(Board, Cols),
    diags1(Board, Diags1),
    diags2(Board, Diags2),
    all_different(Rows),
    all_different(Cols),
    all_different(Diags1),
    all_different(Diags2).

   
%eight_queens([(1,A), (2,B), (3,C), (4,D), (5,E), (6,F), (7,G),(8,H)]).
%diags1([(1,3), (2,7), (3,3), (4,8), (5,2), (6,5), (7,1), (8, 6)], W).