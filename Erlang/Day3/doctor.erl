-module(doctor).
-export([loop/0]).


loop() ->
  process_flag(trap_exit, true),
  receive
    new ->
      io:format("Creating and monitoring process.~n"),
      % spawn_link 产生进程并把进程链接起来 当roulette 终止的时候，doctor会获得通知。
      % 我们可以使用 revolver 给新产生的进程发送消息。
      register(revolver, spawn_link(fun roulette:loop/0)),
      loop();
    {'EXIT', From, Reason} ->
      io:format("The shooter ~p died with reason ~p.~n", [From, Reason]),
      io:format("Restaring. ~n"),
      self() ! new,
      loop()
    end.


% c(doctor).
% D = spawn(fun doctor:loop/0).
% D ! new.
% revolver ! 1.
% revolver ! 3.