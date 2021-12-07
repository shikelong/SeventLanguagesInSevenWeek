
:- use_module(library(clpfd)).
:- set_prolog_flag(answer_write_options,[max_depth(0)]).

valid_queue((Row, Col)) :-
    Range = [1, 2, 3, 4, 5, 6, 7, 8],
    member(Row, Range),
    member(Col, Range).
    
valid_board([]).
valid_board([H|T]) :-
    valid_queue(H),
    valid_board(T).


rows([], []).
rows([(H, _)|T], [H|R]) :-
    rows(T, R).

cols([], []).
cols([(_, H)|T], [H|R]) :-
    cols(T, R).

diags1([], []).
diags1([(R, C)|T], [Diagonal|DiagonalsTail]) :-
  Diagonal is Col - Row,
  diags1(T, DiagonalsTail).

diags2([], []).
diags2([(R, C) | T], [Diagonal|DiagonalsTail]) :-
  Diagonal is Row + Col,
  diags2(T, DiagonalsTail).

eight_queues(Board) :-
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

   
%eight_queues([(1,A), (2,B), (3,C), (4,D), (5,E), (6,F), (7,G),(8,H)]).