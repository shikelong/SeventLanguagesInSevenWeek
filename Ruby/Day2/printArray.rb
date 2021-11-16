# for each array. and print numbers once 4.
arr = (10..25).to_a


# sln1: each
i = 0
buffer = []

arr.each do
  buffer.push(arr[i]) 
  if buffer.size == 4
    puts buffer.join(',')
    buffer = []  
  end
  i += 1
end

puts '-' * 40
# sln2 each_slice

arr.each_slice(4) {|slice| puts slice.join(',')}