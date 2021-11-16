h = {'grandpa' => {'dad' => {'child 1' => {}, 'child2' => {}}, 'uncle' => {'child 3' => {}, 'child 4' => {}}}}

def print(hash)
  if hash.is_a?(Hash) and hash.count > 0
    hash.each do |k,v|
      puts(k)
      print(v)
    end
  end
end

print(h)