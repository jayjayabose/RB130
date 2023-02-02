# rubocop:disable all
=begin
PEDA: 32
45

PROBLEM
Given 
  1. a natural number 
  2. a set of one or more other numbers,  
find the sum of all the multiples of the numbers in the set 
  that are less than the first number.
If the set of numbers is not given, use a default set of 3 and 5.


EXAMPLES / TEST CASES
num: 20 
set: 3,5 (default)

multiples of set elements, less than num
3, 5, 6, 9, 10, 12, 15, and 18. 
  exclude: 1, num
The sum of these multiples is 78.

DATA STRUCTURES
Input:
  Integer: num
  Array: set
    holds inteters
Output:
  Integer: sum
class: SumOfMultiples
  @factors: Array

  self.to(num) -> sum
  to(num) -> sum
  initialize(factors) - obj

ALGORITHM

  self.to(num) -> sum
    Problem:
      class method
      Assumes [3, 5] as factors
    Input: Integer
    Ouput: Integer
    Rules:
      create object: with 3,5 as factors
      invoke #to(sum)   

  to(num) -> sum
    Problem: 
      Instance method
      takes @factors as factors
    Input: Integer
    Ouput: Integer
    Rules:
      Input num will be Integer > 0
      Output: sum of qualifying multiples
      Rules:
        factors will be @factors
        in set of numbers between 2 and num - 1
          identify every number that is a multiple of a factor in factor set
          (qualifying number)
        sum qualifying numbers
    Examples
      (1) => 2..0 => [] => 0
      (4) => 2..3 => [3] => 3
      (10) => 2..9 => [3, 6, 9 // 5] => 2    

    ALGO
    approach: A
      step through factors
        step through range on number line
          add qualifying numbers to output collection
      dedupe and sum output collection

    approach B
      step through range on number line
        check if number is a multipe of any factor in factors
          
      given: 
        Array: @factors
        Integer: num

      init: output = 0
      create a collection of integers: 2 .. num - 1
      iterate through each integer in collection
      #each

        check if number is a multipe of any factor in factors
        # factors.any? { |factor| number % factor == 0 }
      
        if true increment output by number
      
      return output

  initialize(factors) -> obj
    Input: Integers, factors
    Output: Integer sum
    Rules:
      Input will be one or more Integers
      Integers will be integers greater than zero
      Save factors for later
      Raise no errors

=end
# rubocop:enable all
class SumOfMultiples
  def initialize(*factors)
    @factors = factors
  end

  def self.to(num)
    SumOfMultiples.new(3, 5).to(num)
  end

  def to(num)
    (2..num - 1).to_a.select do |i|
      @factors.any? { |factor| (i % factor).zero? }
    end.sum
  end
end
