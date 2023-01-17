def each_cons(array)
  for i in (0...array.size-1)
    yield(array[i], array[i=1])
  end
  nil
end

def each_cons(array)
  1.upto(array.size - 1) do |i|
    yield(array[i-1], array[i])
  end
  nil
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
p result == nil