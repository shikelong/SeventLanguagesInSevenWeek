// 把矩阵写入文件，并从文件中读取矩阵。

doFile("matrix.io")

array println

"----start writing #{array} to ./array1.csv -----" interpolate println

f := File openForUpdating("./array1.csv")

array _data foreach(i, v, 
  f write(v join(","))
  f write("\n")
)

f close


"--- read from './arrayInput.csv'-------" println
f := File openForReading("./arrayInput.csv")
rows := f contents split("\n")


arrayInput := Matrix clone


dimX := (rows size)
dimY := (rows at(0) split(",") size)


dimX println
dimY println
arrayInput dim(dimY, dimX)
arrayInput println
i := 0
j := 0

for (i, 0, dimX - 1,
  for (j, 0, dimY - 1,
    arrayInput set(i, j, rows at(i) split(",") at(j))
  )
)

arrayInput println

