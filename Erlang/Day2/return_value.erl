% 考虑包含键－值元组的列表，如[{erlang, "a functional language"}, {ruby, "an OO language"}]。
% 写一个函数，接受列表和键为参数，返回该键对应的值。

FilterByKey = fun(X) -> element(1, X) == ruby end.

get_value(List, Key) ->
  lists:filter(FilterByKey, List)

