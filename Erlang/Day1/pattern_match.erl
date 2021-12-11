%写一个函数，在给定输入为{error, Message}或success的条件下，利用匹配相应地打
%印出"success"或"error: message"。
-module(pattern_match).
-export([print/1]).


print(success) -> success;
print({error, Message}) -> "error: " ++ Message.