% n, from, buffer, to
% https://www.zhihu.com/question/24385418
% From(1), Target(3), Center
move(1, F, T, _) :-
  write('move top disk from '),
  write(F),
  write(' to '),
  write(T),
  nl.
  
move(P, F, T, C) :-
  P > 1,
  P1 is P - 1,
  move(P1, F, C, T),
  move(1, F, T, _),
  move(P1, C, T, F).





