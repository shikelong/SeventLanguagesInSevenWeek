% ：读取一个大小为9的列表或元组，表示井字棋（tic-tac-toe）的棋盘。若胜负已定，
% 则返回胜者（x或o）；若再没有可走的棋着，则返回cat；若两方都还没赢，则返回
% no_winner。
-module(tic_tac_toe).
-export([read/1]).


% 1,2,3,
% 4,5,6,
% 7,8,9
-define(CHECK_RULES, [{1,2,3}, {4,5,6}, {7,8,9}, {1,4,7}, {2,5,8}, {3,6,9}, {1,5,9}, {3,5,7}]).

getWinner(B) ->
  Ro = checkBoard(B, o, 1),
  Rx = checkBoard(B, x, 1),
  if 
    Ro and (not Rx) -> o;
    Rx and (not Ro) -> x;
    (not Ro) and (not Rx) -> nil
  end.
  

read([]) -> [];
read(B) ->
  Winner = getWinner(B),
  IsFull = checkIsFull(B),
  if 
    Winner =/= nil -> Winner;
    true -> 
      if
        IsFull -> cat;
        true -> no_winner
      end
  end.
 
checkBoard(Board, Symbol, I) -> 
  if 
    I >= length(?CHECK_RULES) -> false;
    true -> innerCheckBoard(Board, Symbol, I)
  end.

innerCheckBoard(Board, Symbol, I) -> 
  Rule = lists:nth(I, ?CHECK_RULES),
  {P1, P2, P3} = Rule,
  {V1, V2, V3} = {lists:nth(P1, Board), lists:nth(P2, Board), lists:nth(P3, Board)},
  if 
    (V1 == V2) and (V2 == V3) and (V1 == Symbol) -> true;
    true -> checkBoard(Board, Symbol, I + 1)
  end.


checkIsFull([H|T]) -> 
  if 
    (H == x) or (H == o) -> 
      if 
        T == [] -> true;
        true -> checkIsFull(T)
      end;
    true -> false
end.





    
