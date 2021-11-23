// 对列表增加一个名为myAverage的槽，以计算列表中所有数字的平均值。如果列表中没有
// 数字会发生什么？（加分题：如果列表中有任何一项不是数字，则产生一个Io异常。）

l1 := list(1,12, -1, 9, 12312)

l2 := list(123, 12312, 1999, -20000, "123123")



List myAverage := method(

 
  hasUnNumber := ((call target) select(x, x type != "Number") size > 0)
  (hasUnNumber) ifTrue (Exception raise("Parameter error —— list's item must be Number"))


  call target sum / call target size

)


l1 myAverage println
l2 myAverage println