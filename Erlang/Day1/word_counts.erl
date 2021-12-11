%写一个函数，用递归返回字符串中的单词数

-module(word_counts).
-export([count_words/1]).


count_words(String) -> 
  count_words(String, 0).

-define(SP, ($ )).
-define(TB, $\t).
-define(CR, $\r).
-define(LF, $\n).


count_words([], Count) -> Count;

% Last character. If it isn't a white-space, count it as a word.
count_words([Last], Count)
  when (Last =/= ?SP andalso Last =/= ? TB andalso Last =/= ?CR andalso Last =/= ?LF) -> Count + 1
;
% We found a word-separating character; count as a word and continue from the character immediately after the separator.
count_words([FirstCharacter, SecondCharacter | AllOtherCharacters], Count)
  when (FirstCharacter =/= ?SP andalso FirstCharacter =/= ?TB andalso FirstCharacter =/= ?CR andalso FirstCharacter =/= ?LF)
       andalso
       (SecondCharacter =:= ?SP orelse SecondCharacter =:= ?TB orelse SecondCharacter =:= ?CR orelse SecondCharacter =:= ?LF)
  -> count_words([SecondCharacter | AllOtherCharacters], Count + 1)
;

% Any other character means we are still within a word; just keep going.
count_words([_ | AllOtherCharacters], Count)
  -> count_words(AllOtherCharacters, Count)
.


