-module(hw1).
-behaviour(supervisor).
-export([loop/0, translate/1]).
-export([start_service/0]).
-export([init/1]).
-export([start/0]).

loop() -> 
  receive
    {From, "casa"} -> 
      From ! "house",
      loop();
    {From, "balance"} -> 
      From ! "white",
      loop();
    {From, M} -> 
      From ! "I don't understand. ",
      exit({M, not_understood, received_at, erlang:time()})
end.

translate(Word) ->
  translator ! {self(), Word},
  receive
    Translation -> Translation
  end.

start() ->
  io:fwrite("starting...~n"),
  register(translator, spawn_link(hw1, loop, [])),
  {ok, whereis(translator)}.

init(_) -> 
  {ok, {{one_for_one, 1, 60},
  [{hw1, {hw1, start, []},
  permanent, brutal_kill, worker, [hw1]}]}}.


start_service() -> 
  io:fwrite("start_service~n"),
  supervisor:start_link(hw1, []).


% 1. compile.
% 2. start_service.
% 3. translate("casa")
% 3. translate("casa1")