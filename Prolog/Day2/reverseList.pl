myreverse([], []).
myreverse([H], [H]).
myreverse([H|T], R) :- 
  myreverse(T, RT), 
  append(RT, [H], R).