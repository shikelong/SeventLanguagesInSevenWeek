% 0! = 1
% 2! = 2*1 = 2
% 3! = 3 * 2 * 1 = 6
factorial(0,1).
factorial(N,F) :-
  N > 0,
  N1 is N - 1,
  factorial(N1,F1),
  F is N * F1.