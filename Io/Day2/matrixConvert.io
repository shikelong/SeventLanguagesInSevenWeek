// 加分题：写一个转置方法，使得原列表上的matrix get(x, y)与转置后列表的
// (new_matrix get(y, x))相等。

doFile("matrix.io")

"------------------------------------------------" println

array println


Matrix transpose := method(
  x := (call target) size() at(0)
  y := (call target) size() at(1)
  result := Matrix clone() 
  result dim(y, x)

  i := 0
  j := 0
  for(i, 0, x - 1,

    for (j, 0, y - 1,
      result set(j, i, (call target) get(i, j))
    )
  )

  result
)

newArr := array transpose()


(newArr get(0, 1) == array get(1, 0)) println
(newArr get(1, 2) == array get(2, 1)) println
(newArr get(2, 2) == array get(2, 2)) println
(newArr get(2, 0) == array get(0, 2)) println