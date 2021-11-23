// 斐波那契数列以两个1开始，每一个数都是之前两个数之和：1，1，2，3，5，8，13，21，
// 以此类推。写一个计算第n个斐波那契数的程序。这里fib(1)会得到1，fib(4)会得到3。
// 如果你能用递归和循环两种方法写出来，我将给你额外加分。


fib := method(n, 
  (n == 1 or n == 2) ifTrue(return 1) ifFalse(
    return fib(n-1) + fib(n-2)
  )
)

fib(8) println


fib2 := method(n, 
  (n == 1 or n == 2) ifTrue(return 1)

  i ::= 1
  pre ::= 1
  prePre ::= 1
  
  for (i, 3, n, 1, 
    (i == n) ifTrue(return pre + prePre)

    temp ::= pre
    pre = temp + prePre
    prePre = temp
  )
)

fib2(8) println