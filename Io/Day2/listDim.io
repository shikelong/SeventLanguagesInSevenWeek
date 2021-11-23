// 对二维列表写一个原型。该原型的dim(x, y)方法可为一个包含y个列表的列表分配内存，
// 其中每个列表都有x个元素，set(x, y)方法可设置列表中的值，get(x, y)方法可返回
// 列表中的值。

TwoDimensionalArray := Object clone

TwoDimensionalArray dim := method(x, y,
  (call target) _data := list()
  _data setSize(y)

  _data foreach(i, v,
    item := list()
    item setSize(x)
    _data atPut(i, item)
  )
)

TwoDimensionalArray set := method(x, y, v,
  call target indexRangeCheck(x, y)
  temp := (call target _data) at(x)
  temp atPut(y, v)
  (call target _data) atPut(x, temp)
)


TwoDimensionalArray get := method(x, y,
  call target indexRangeCheck(x, y)
  return (((call target) _data) at(x)) at(y)
)

TwoDimensionalArray indexRangeCheck := method(x, y,
  isOutRange := (x > (call target _data) size) or (y > (call target _data) at(0) size)
  if (isOutRange, Exception raise("index out of range. index must in #{(call target _data) size} and #{(call target _data) at(0) size}" interpolate))
)

array := TwoDimensionalArray clone

array dim(3, 2) 

array set(0,1, 200)
array set(1,2, 100)

array get(1,2) println

array get(11,2) println
