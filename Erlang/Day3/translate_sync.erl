-module(translate_sync).
-export([loop/0, translate/2]).

loop() -> 
  receive
    {From, "casa"} -> 
      From ! "house",
      loop();
    {From, "balance"} -> 
      From ! "white",
      loop();
    {From, _} -> 
      From ! "I don't understand. ",
      loop()
end.

translate(To, Word) ->
  To ! {self(), Word},
  receive
    Translation -> Translation
  end.


% Guide
% 1. compile this module.
% 2. Translator = spawn(fun translate_sync:loop/0).
% 3. translate_sync:translate(Translator, "casa").