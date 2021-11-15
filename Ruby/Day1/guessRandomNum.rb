

puts "This program will generate a random num [x] from 0 ~ 9, please guess x"

x = rand(10)

while gets
  puts "Your guess is: #{$_}"
  if $_.to_i == x
    puts "You are right!"
    break
  else
    puts "You are wrong!"
  end
end
    