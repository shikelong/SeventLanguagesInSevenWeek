// 写一个程序，提供10次尝试机会，猜一个1～100之间的随机数。如果你愿意的话，可以
// 在第一次猜测之后，提示猜大了还是猜小了。



#Rio: Random not included in io native lib, so, I will use a CONST mock random value here.
#randomNumber := (Random value( 99 ) + 1) floor();

randomNumber := 42

"please type a number between 1 and 100..." println
for (i, 0, 9, 1, 
  x := File standardInput readLine asNumber

  if (x < randomNumber) then (
    "too small" println
    continue
  ) elseif (x > randomNumber) then (
    "too big" println
    continue
  ) else (
    "correct" println
    return
  )
  
)



