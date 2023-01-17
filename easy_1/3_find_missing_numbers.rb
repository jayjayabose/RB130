# Write a method that takes a sorted array of integers as an argument, 
# and returns an array that includes all of the missing integers (in order) 
# between the first and last elements of the argument.


# def missing(array)
#   output = []
#   array.first.upto(array.last) do |i|
#     output << i unless array.include? i
#   end
#   output
# end

# def missing(array)
#   result = []
#   array.each_cons(2) do |first, second|
#     result.concat(((first + 1)..(second - 1)).to_a)
#   end
#   result
# end

# without block
def missing(array)
  counter = 0
  result = []

  while counter < array.length - 1
    first = array[counter]
    second = array[counter +1]
    result.concat(((first + 1)..(second -1)).to_a)
    counter +=1
  end
  result
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []