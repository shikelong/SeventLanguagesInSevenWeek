-module(translate).
-export([loop/0]).

loop() -> 
  receive
    "casa" -> 
      io:format("house~n"),
      loop();
    "balance" -> 
      io:format("white~n"),
      loop();
    _ -> 
      io:format("I don't understand. ~n"),
      loop()
end.



% Guide
% 1. compile this module.
% 2. Pid = spawn(fun translate:loop/0) 这一步启动了一个轻量的进程，其参数函数会在进程中启动。
% 3. 给产生的进程发送消息。
%   Pid ! "casa"
%   Pid ! "balance"
%   Pid ! "test"
% 使用 node@server ! message 形式来把分布式消息传递给对应的节点
