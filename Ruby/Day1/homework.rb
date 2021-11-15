#utils
def printSplit
  puts '-' * 50
end


#1
puts "Hello, world"

printSplit

#2
helloRuby = "Hello, Ruby."
puts helloRuby.index("Ruby.")

printSplit
#3
x = 0
until x == 10 do
  puts x.to_s + ".rioshi"
  x += 1  
end

printSplit
y = 0
while y <= 10 
  puts "this is a sentence number " + y.to_s + "."
  y += 1
end
printSplit