# rubocop:disable all
=begin
Total; 32m: PEDA: 20m; C: 12m (slight bump with case statement)
PROBLEM
Description

Write a program that can tell whether a number is perfect, abundant, or deficient.


Input: Number
Output; String
Rules:
  input 
    is integer
    is > 0
  output (one of three classifications)
    'dificient' | 'perfect' | 'abundant'
  every valid input can be classified

  Perfect 
    Aliquot sum = original number.
  Abundant 
    Aliquot sum > original number.
  Deficient
    Aliquot <  original number.

  Aliquot sum = sum of positive divisors of original number
  positive divisors
    numbers that can be evenly divided into number excluding number
      e.g. positive divisors of 15 are 1, 3, and 5. 
  
EXAMPLES / TEST CASES
6 is a perfect number since its 
  divisors are 1, 2, and 3, and 
  1 + 2 + 3 = 6.
28 is a perfect number since its 
  divisors are 1, 2, 4, 7, and 
  14 and 1 + 2 + 4 + 7 + 14 = 28.
15 is a deficient number since 
  its divisors are 1, 3, and 5 and 
  1 + 3 + 5 = 9 which is less than 15.
24 is an abundant number since its 
  divisors are 1, 2, 3, 4, 6, 8, and 
  12 and 1 + 2 + 3 + 4 + 6 + 8 + 12 = 36 which is greater than 24.

Prime numbers 7, 13, etc. are always deficient since their only divisor is 1.

DATA STRUCTURES
class PerfectNumber
  class method :: classify
    Input: Integer
    Output:
      classification
      Raise error if input < 1

ALGORITHM
what about 1?

Given Number: num
sum = 0
# find divisors and add to sum
  iterate from 1 .. num - 1 (can optimize this ) with index i
    if n % i == 0, i is a divisor, add to sum

# compare to number to determine classification
case 
  sum < n then 'deficient'
  sum . n then 'abundant'
  abundant

=end
# rubocop:enable all
class PerfectNumber
  def self.classify(num)
    validate_number(num)

    sum = 0
    1.upto(num - 1) { |i| sum += i if num % i == 0 }

    return 'deficient' if sum < num
    return 'abundant' if sum > num
    'perfect'
  end

  def self.validate_number(num)
    msg = 'Number must be Integer greater than zero'
    raise StandardError, msg if num < 1
    num
  end
end
