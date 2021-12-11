//编写一个Censor trait，包含一个可将Pucky和Beans替换为Shoot和Darn的方法。使用
//映射存储脏话和它们的替代品。
// 从一个文件中加载脏话或它们的替代品

import scala.collection.mutable.Map;

trait Censor {
  def clear_text(texts: String, bad_language_map: Map[String, String]) :String = {
    var result = texts;

    bad_language_map.foreach((map) => {
       result = result.replaceAll(map._1, map._2);
    })

    return result;
  }
}


class Test extends Censor {
  var word_map = Map[String, String]();
  var fileName = "dirty_words.csv";
  var bufferedSource = scala.io.Source.fromFile(fileName);
  bufferedSource.getLines().foreach(line => {
    word_map += (line.split(",")(0) -> line.split(",")(1))
  })

  def say_hello(words: String) = {
    println(clear_text(words, word_map))
  }
}



var test = new Test();
test.say_hello("Hello, I'm dio, My father is Pucky and My momo is Beans.")

