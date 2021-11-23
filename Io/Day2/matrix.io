// 对二维列表写一个原型。该原型的dim(x, y)方法可为一个包含y个列表的列表分配内存，
// 其中每个列表都有x个元素，set(x, y)方法可设置列表中的值，get(x, y)方法可返回
// 列表中的值。

Matrix := Object clone

Matrix dim := method(x, y,
  (call target) _data := list()
  _data setSize(y)

  _data foreach(i, v,
    item := list()
    item setSize(x)
    _data atPut(i, item)
  )
)

Matrix set := method(x, y, v,
  call target indexRangeCheck(x, y)
  temp := (call target _data) at(x)
  temp atPut(y, v)
  (call target _data) atPut(x, temp)
)


Matrix get := method(x, y,
  call target indexRangeCheck(x, y)
  return (((call target) _data) at(x)) at(y)
)

Matrix indexRangeCheck := method(x, y,
  size := self size()
  isOutRange := (x > size at(0)) or (y > size at(1))
  if (isOutRange, Exception raise("index out of range. index must in #{(call target _data) size} and #{(call target _data) at(0) size}" interpolate))
)

Matrix size := method(
  return list((call target _data) size, (call target _data) at(0) size)
)

array := Matrix clone

array dim(3, 3) 

array set(0, 0, 1)
array set(0, 1, 2)
array set(0, 2, 3)
array set(1, 0, 4)
array set(1,1, 5)
array set(1,2, 6)
array set(2, 0, 7)
array set(2,1, 8)
array set(2,2, 9)

array get(1,2)

// array get(11,2) println
