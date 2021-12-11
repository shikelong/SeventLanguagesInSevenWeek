%写一个递归计数到10的函数。
-module(count).
-export([count/1]).

count(N) -> 
  if
      (N =< 10) -> io:write(N), io:nl(), count(N + 1);
      true -> nil
  end.

% count_to_ten() -> do_count(0).
 
% do_count(10) -> 10;
% do_count(Value) -> do_count(Value + 1).
