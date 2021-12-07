
Builder := Object clone do (
  indent := ""
  //forward 类似于 Ruby 的 method_missing
  forward := method(
    writeln(indent, "<", call message name, ">")

    // writeln("Args: ",  call message arguments at(0))
  
    call message arguments foreach(arg,
      indent = indent .. "    "
      content := self doMessage(arg);
      if (content type == "Sequence", writeln(indent, content))
      indent = indent exclusiveSlice(4)
    )
    writeln(indent, "</", call message name, ">")
  )
)

Builder body(
  h1("Hello World"),
  div(
    p("This is a paragraph"),
    ul(
      li("Io"),
      li("Lua"),
      li("Ruby")
    )
  )
)
