# rubocop:disable all
=begin
PEDA 11min, Coding 19 min
PROBLEM
Write a program that can tell whether a number is 
  perfect, abundant, or deficient.

EXAMPLES / TEST CASES
6 is a perfect number since its divisors are 
  1, 2, and 3, and 1 + 2 + 3 = 6.
28 is a perfect number since its divisors are 
  1, 2, 4, 7, and 14 and 1 + 2 + 4 + 7 + 14 = 28.
15 is a deficient number since its divisors are 
  1, 3, and 5 and 1 + 3 + 5 = 9 which is less than 15.
24 is an abundant number since its divisors are 
  1, 2, 3, 4, 6, 8, and 12 and 1 + 2 + 3 + 4 + 6 + 8 + 12 = 36 which is greater than 24.

Prime numbers 7, 13, etc. are always deficient since their only divisor is 1.

DATA STRUCTURES
class: PerfectNumber
  ::classify(number) -> classification

Numbers
 
ALGORITHM
  ::classify(number) -> classification
  Input: number
  Output: classification
  Rules
    number will be integer
    raise error if number < 0
    Aliquot sum
      sum of divisors of number
      exclude number
      include 1
    divisor
      i % number == 0
    return string 
      'perfect': Aliquot sum  is equal to number.
      'abundant' : Aliquot sum is greater than the number.
      'deficient'  Aliquot sum less than the number.

  Approach
    iterate 1 .. number - 1
      if i is divisor, add to sum

  Pseudocode
    validate(number)
    calculate aliquot_sum
    init range: (1...number).to_a.select
        blcok returns true for divisor
    #sum

    if sum > number
      abundance
    else if sum < number
      deficient
    else
      perfect

=end
# rubocop:enable all
class PerfectNumber
  def self.classify(number)
    validate(number)
    aliquot_sum = calculate_aliquot_sum(number)

    case aliquot_sum <=> number
    when 1 then 'abundant'
    when -1 then 'deficient'
    else 'perfect'
    end
  end

  def self.validate(number)
    msg = 'Argumeent must be a postive integer.'
    raise StandardError, msg if number < 0
  end

  def self.calculate_aliquot_sum(number)
    (1...number).to_a.select { |i| number % i == 0 }.sum
  end
end
