=begin
P:
Write a method that 
  returns a list of all of the divisors of the 
  The return value can be in any sequence you wish.
  positive integer passed in as an argument. 
  
Input: positive integer
Output:list os dvisors
Rules

Examples
7
1

Algo
step trhough 1 .. n / 2
  if n % i == 0 add to output
=end

def timer
  start_time = Time.now
  yield
  end_time = Time.now
  puts "Execution time: #{(end_time - start_time)} seconds"  
end

def divisors(num)
  output = []
  1.upto(num/2) do |i|
    output << i if num % i == 0 
  end
  output + [num]
end

timer { p divisors(1) == [1] }
# p divisors(2) == [1, 2]
# p divisors(7) == [1, 7]
# p divisors(12) == [1, 2, 3, 4, 6, 12]
# p divisors(98) == [1, 2, 7, 14, 49, 98]
timer { p divisors(99400891) == [1, 9967, 9973, 99400891] } # may take a minute
# p divisors(999962000357)