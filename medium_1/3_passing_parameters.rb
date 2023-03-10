# Modify the method below so that the display/output of items is moved to a block, 
# and its implementation is left up to the user of the gather method.

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  # puts "#{items.join(', ')}"
  yield(items)
  puts "Nice selection of food we have gathered!"
end

# gather(items) { |produce|  puts "#{produce.join(', ')}" }

gather(items) do |produce| 
  produce.each { |element| puts "#{element} \n"}
end