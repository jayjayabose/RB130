=begin
0 1 2 3 4 5 

num = 2; size -1
num = 3; size -2 => 6 - 2 = 4
=end

# def each_cons(array, num)
#   max_i = array.size - (num - 1)
#   for i in (0...max_i)
#     args = []
#     for i in (i...i+num)
#       args << array[i]
#     end
#     yield *args
#   end
#   nil
# end

def each_cons(array, num)
  max_index = array.size - num
  0.upto(max_index) do |index_1|
    args = []
    num.times do |n|
      args << array[index_1 + n]
    end
    # index_1.upto(index_1+num-1) do |index_2|
    #   args << array[index_2]
    # end
    yield *args
  end
  nil
end

hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
p hash == {}