// {"Rio": "1232132132", "Bill": "453131231"}
//--> atPutNumber("Rio", "1232132132")   atPutNumber("Bill", "453131231")

OperatorTable addAssignOperator(":", "atPutNumber")

curlyBrackets := method(
  r := Map clone
  call message arguments foreach(arg,
    r doMessage(arg)
  )
  r
)

Map atPutNumber := method(
  self atPut(
    call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),  
    call evalArgAt(1)
  )
)

s := File with("phonebook.txt") openForReading contents
phoneNumbers := doString(s)
phoneNumbers keys println
phoneNumbers values println