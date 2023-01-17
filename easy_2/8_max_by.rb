def max_by(array)
  max_item = nil
  array.each do |item|
    
  end

  max_item
# def max_by(array)
#   return nil if array.empty?

#   max_value = yield array.first
#   max_index = 0

#   array.each_with_index do |item, index|
#     item_value = yield(item)
#     if item_value > max_value
#       max_value = item_value
#       max_index = index
#     end
#   end
#   array[max_index]
# end

# def max_by(array)
#   output = nil
#   output_block_value = 0

#   array.each do |item|
#     if output.nil?
#       output = item
#       output_block_value = yield(item)
#     else
#       item_block_value = yield(item)
#       if item_block_value > output_block_value
#         output = item
#         output_block_value = item_block_value
#       end
#     end 
#   end
#   output
# end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil