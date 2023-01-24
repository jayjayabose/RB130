items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

#1
gather(items) do | *rest, wheat|
  puts rest.join(', ')
  puts wheat
end
# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!


#2
gather(items) do | apples, *rest, wheat |
  puts apples
  puts rest.join(', ')
  puts wheat
end
# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!

#3
gather(items) do | apples, *rest |
  puts apples
  puts rest.join(', ')
end
# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!


#4
gather(items) do | apples, corn, cabbage, wheat|
  puts [apples, corn, cabbage, wheat].join(', ')
end
# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!