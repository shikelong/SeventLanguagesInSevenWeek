
concatenate([], List, List).
% concatenate([Head|[]], List, [Head|List]).
% concatenate([Head1|[Head2|[]]], List, [Head1, Head2|List]).
% concatenate([Head1|[Head2|[Head3 | []]]], List, [Head1, Head2, Head3|List]).

concatenate([Head|Tail], List, [Head|Tail2]) :- 
  concatenate(Tail, List, Tail2).