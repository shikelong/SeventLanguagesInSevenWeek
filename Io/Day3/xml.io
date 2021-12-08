indentSize := 2

OperatorTable addAssignOperator(":", "atParseHash")


Builder := Object clone do (
  indent := ""

  atParseHash := method(
    key := call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\"")
    value := call evalArgAt(1)
    " #{key}=\"#{value}\"" interpolate
  )

  curlyBrackets := method(
    call message arguments map(arg, self doMessage(arg)) join("")
  )
 
  //forward 类似于 Ruby 的 method_missing
  forward := method(
    name := call message name
    arguments := call message arguments


    attrs := ""
    if (arguments size > 0 and arguments at(0) name == "curlyBrackets",  
      attrs = doMessage(arguments removeFirst) 
    )

    writeln(indent, "<", name, attrs, ">")
    arguments foreach(arg,
      indent = indent .. (" " repeated(indentSize))
      content := self doMessage(arg);
      if (content type == "Sequence", writeln(indent, content))
      indent = indent exclusiveSlice(indentSize)
    )
    writeln(indent, "</", name, ">")
  )
)

doFile("BuilderNewTest.io")