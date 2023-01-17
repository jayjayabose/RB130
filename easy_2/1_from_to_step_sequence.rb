def step(low_value, high_value, step_value)
  # start.upto(end) do |i|
  # end

  i = low_value
  until i > high_value
    yield i
    i += step_value
  end
end


p step(1, 10, 3) { |value| puts "value = #{value}" }

# value = 1
# value = 4
# value = 7
# value = 10