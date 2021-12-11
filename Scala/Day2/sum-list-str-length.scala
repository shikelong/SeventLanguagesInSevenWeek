//使用foldLeft方法计算一个列表中所有字符串的总长度。


def sum_list_str_length(list: List[String]): Int = {
  return list.foldLeft(0)((sum, str) => sum + str.length);
}

def sum_list_str_length2(list: List[String]): Int = {
  return (0 /: list){(sum, str) => sum + str.length};
}


println(sum_list_str_length(List("2213", "1", "shites", "helloworld")));
println(sum_list_str_length(List("2213", "1")));
println(sum_list_str_length(List("2213", "1", "shites", "helloworld")));
println(sum_list_str_length2(List("2213", "1")));
