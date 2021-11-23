//写一个程序，把二维数组中的所有数相加


twoDimensionalArray := List clone
twoDimensionalArray append(list(1,2,3))
twoDimensionalArray append(list(4,5,6))
twoDimensionalArray append(list(7,8,9))


twoDimensionalArray println


sumArray := method(array, 
  sum := 0
  array foreach(v, 
    sum = sum + v sum
  )
  sum
)

sumArray(twoDimensionalArray) println