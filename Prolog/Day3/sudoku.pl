:- use_module(library(clpfd)).
:- set_prolog_flag(answer_write_options,[max_depth(0)]).

valid_domain(List, Min, Max) :-
  List ins Min..Max.

valid([]).
valid([Head|Tail]) :-
  all_different(Head),
  valid(Tail).
  

% 4 * 4 sudoku

%rule1: 已经解决的问题，和解决方法中的数字一致
% 数字应该在 1～4， 并且范围为4*4
sudoku(Puzzle, Solution) :-
    Solution = Puzzle,
    Puzzle = [S11, S12, S13, S14,
              S21, S22, S23, S24,
              S31, S32, S33, S34,
              S41, S42, S43, S44],
    valid_domain(Puzzle, 1, 4), 
    Row1 = [S11, S12, S13, S14],
    Row2 = [S21, S22, S23, S24],
    Row3 = [S31, S32, S33, S34],
    Row4 = [S41, S42, S43, S44],
    Col1 = [S11, S21, S31, S41],
    Col2 = [S12, S22, S32, S42],
    Col3 = [S13, S23, S33, S43],
    Col4 = [S14, S24, S34, S44],
    Square1 = [S11, S12, S21, S22],
    Square2 = [S13, S14, S23, S24],
    Square3 = [S31, S32, S41, S42],
    Square4 = [S33, S34, S43, S44],
    valid([Row1, Row2, Row3, Row4,
           Col1, Col2, Col3, Col4,
           Square1, Square2, Square3, Square4]).



% sudoku([_, _,2,3,_,_,_,_,_,_,_,_,3,4,_,_], W).



