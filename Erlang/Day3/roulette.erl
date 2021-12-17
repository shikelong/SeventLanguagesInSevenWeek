-module(roulette).
-export([loop/0]).



% send 1~6.
% erlang:is_process_alive(Pid). 
loop() ->
  receive 
    3 -> io:format("bang!.~n"), exit({roulette, die, at, erlang:time()});
    _ -> io:format("click.~n"), loop()
end.