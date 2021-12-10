import scala.language.postfixOps
import scala.util.control.Breaks.{break, breakable}
import scala.io.StdIn.readLine


final case class GameException(private val message: String = "", private val cause: Throwable = None.orNull) extends Exception(message, cause);

class Board(width: Int, height: Int) {
  val cells = Array.ofDim[String](width, height)
  for (i <- 0 until width; j <- 0 until height) {
    cells(i)(j) = ""
  }

  def getCell(x: Int, y: Int): String = {
    cells(x)(y)
  }

  def setCell(x: Int, y: Int, value: String) {
    cells(x)(y) = value
  }

  def printBoard() {
    for (i <- 0 until width; j <- 0 until height) {
      print(if (cells(i)(j) == "") ". " else cells(i)(j) + " ");
      if (j == height - 1) println()
    }
  }

  def getRow(rowIndex: Int): Array[String] = {
    cells(rowIndex)
  }

  def getCol(colindex: Int): Array[String] = {
    val col = Array.ofDim[String](height)
    for (i <- 0 until height) {
      col(i) = cells(i)(colindex)
    }
    col
  }

  def getDiagonal(isUp: Boolean): Array[String] = {
    val diagonal = Array.ofDim[String](height)
    var i = 0
    if (isUp) {
      for (j <- 0 until height) {
        diagonal(i) = cells(j)(j)
        i += 1
      }
    } else {
      for (j <- 0 until height) {
        diagonal(i) = cells(j)(height - j - 1)
        i += 1
      }
    }
    diagonal
  }

  def isFull(): Boolean = {
    for (i <- 0 until width; j <- 0 until height) {
      if (cells(i)(j) == "") return false
    }
    true
  }


}

class Player(val name: String, val symbol: String);

//编写一个游戏，可以用X、O和空字符玩井字游戏（tic-tac-toe），检查是否有胜者，或是
//否不分胜负，或目前没有胜者。适当地使用类。
// 加分题：让两个选手玩井字游戏。
class Game(hasPlayer2: Boolean = false) {
  private val BoardWidth = 3;
  private val BoardHeight = 3;
  private val boards = new Board(BoardWidth, BoardHeight)

  println("-".repeat(50));
  println("💪 Welcome to Tic-Tac-Toe!")
  println("Game will starting, please type the position you want to put your mark.")
  println("For example, if you want to put your mark in the position (1,1), type 1 1")

  private val player1 = new Player("Player1", "X")
  private val player2 = new Player("Player2", "O")
  private var curPlayer: Player = player1

  def play(): Unit = {

    println("🧮 Current Board Status: ")
    boards.printBoard();

    //step1. await player
    val (x, y) = waitPlayerInput();
    if (x == -1 && y == -1) {
      println("💀 You give up this turn..")
      swapPlayer();
      play();
      return;
    }
    //set board..
    boards.setCell(x, y, curPlayer.symbol);
    //judge is game final.
    if (checkIsExistWinner()) {
      return;
    }
    if (boards.isFull()) {
      println("💔 Game is draw!")
      return;
    }
    swapPlayer();

    //then await cur player.
    play();

  }

  private def swapPlayer() = {
    //swap player.
    curPlayer = if (curPlayer == player1) player2 else player1;
  }

  private def waitPlayerInput(): (Int, Int) = {
    println(s"🏋️ It's ${curPlayer.name} 's turn...")
    println("🏸 please input position in form x y, (range in [0,2])...")
    val input = readLine()

    if (input == null || input.trim.isEmpty) {
      //弃权
      return (-1, -1);
    }

    try {
      val (x, y) = parseInput(input)

      //check is valid input.
      if (boards.getCell(x, y) != "") {
        throw new GameException(s"😥 position ${(x, y)} exist symbol, please type another position..");
      }

      return (x, y);
    } catch {
      case e: GameException => println(e.getMessage()); return waitPlayerInput();
      case e => println("😥 Could not parse your input, please try again.."); return waitPlayerInput();
    }
  }


  private def parseInput(input: String): (Int, Int) = {
    try {
      var x: Int = 0;
      var y: Int = 0;
      x = input.split(" ")(0).toInt;
      y = input.split(" ")(1).toInt;

      if ((x < 0 || x >= BoardWidth) || (y < 0) || y >= BoardHeight) {
        throw new GameException();
      }

      (x, y)
    } catch {
      case e: Exception => throw new GameException("😥 input invalid, x or y must more than 0 and less than " + BoardWidth + "," + BoardHeight + ".");
    }
  }


  private def checkIsExistWinner(): Boolean = {
    val checkItems = Array(
      boards.getRow(0),
      boards.getRow(1),
      boards.getRow(2),
      boards.getCol(0),
      boards.getCol(1),
      boards.getCol(2),
      boards.getDiagonal(false),
      boards.getDiagonal(true)
    );

    //do check
    for (i <- 0 until checkItems.length) {
      val checkItem = checkItems(i);

      var symbol: String = ""
      breakable {
        for (j <- 0 until checkItem.length) {
          if (checkItem(j) == "") {
            break;
          }
          if (symbol != "" && symbol != checkItem(j)) {
            break;
          }

          if (j == checkItem.length - 1){
            println("debug: value is" + checkItem.mkString(" "));
          }


          if (symbol == checkItem(j) && j == checkItem.length - 1) {
            val winner = if (player1.symbol == symbol) player1.name else player2.name;
            println("🏆 Game over! Winner is " + winner);
            println("The final board is: ");
            boards.printBoard();
            println("-".repeat(50))
            return true;
          }

          symbol = checkItem(j);
        }
      }

    }
    false
  }


}


var gameWithComputer = new Game(false)
gameWithComputer.play()

