Builder html(
  head(
    title("Test webpage")
  ),
  body(
    h1("Welcome to my test webpage!"),
    div({"class": "content", "id": "main"},
      p("Lots of fun to be had!"),
      p("Don't forget to sign the guest book")
    )
  )
)