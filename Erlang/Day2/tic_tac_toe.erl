% ：读取一个大小为9的列表或元组，表示井字棋（tic-tac-toe）的棋盘。若胜负已定，
% 则返回胜者（x或o）；若再没有可走的棋着，则返回cat；若两方都还没赢，则返回
% no_winner。
-module(tic_tac_toe).
-export([read/1]).


% Board = [_,x,_,o,_,_o,x,_].

% IsResolved = fun(X) -> member(X, [o, x]) end.

% read(Board) -> lists:all(, Board).
    