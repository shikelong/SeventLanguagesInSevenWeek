
puts "start grep in ./Data/grep.txt"
puts "-" * 50

puts "please input search key word to search match rows in Data/grep.txt"
gets

if $_.to_s.length == 0
  throw "input cannot be empty"
end

puts "The matched row is: "
File.open(File.absolute_path("Data/grep.txt"), "r").each_with_index do |row, index|
  if /#{$_.strip}/i.match(row.to_s).is_a?(MatchData)
    puts (index + 1).to_s + ". --> " + row.to_s
  end
end