# rubocop:disable all
=begin
PEDA: 1hr + 10 minutes
Coding: 20 minutes

PROBLEM
Description: 
Write some code that converts modern decimal numbers into their Roman number equivalents.

EXAMPLES / TEST CASES

1990 is MCMXC:
M+CM+XC:
  1000=M
  900=CM
  90=XC


2008 is written as MMVIII
MM+VIII
  2000=MM
  8=VIII

smaller number left of bigger number indiates subtraction: IV = 4
1-3: I, II, III, 
4-5: IV, V
6-8: VI, VII, VIII, 
9-10: IX, X

11-13: XI, XII, XIII, 
13-15: XIV, XV

DATA STRUCURES
class: RomanNumeral
  attribute
    number
  methods
    #constructor()
      takes a number 1-3000
    #to_roman
      return: roman number equivalent

ALGORITHM

given number: e.g 1024
1. separate number to "place values":
  e.g. 
  4
  20
  1000
  => [1,0,2,4]

  steps
    convert to string
    convert to array of characters


2 convert each digit to roman form  
  e.g. 
  4 => IV
  20 = XX
  1000 = M
  => ['M', nil, 'XX', 'IV']

  steps
    given array,  
    reverse array
    transform array
      iterate through each element, with index
        convert_digit (element, index)
    reverse array

3 assemble output
=> M+XX+IV

convert_digit(digit, index)
====
convert digit to integer
unit = char_lookup_hashes[i][:unit]

ones = {unit: 'I', midpoint: 'V', next_unit: 'X'}
tens = {unit: 'X', midpoint: 'L', next_unit: 'C'}
hundreds = {unit: 'C', midpoint: 'D', next_unit: 'M'}
thousands = {unit: 'M', midpoint: 'V̅', next_unit: 'X̅'}
char_lookup_hashes = [ones, tens, hundreds, thousands]

case (1..3) then: unit * digit
case 4 then unit + midpoint
case 5 then midpoint
case 5..8 then midpoint + unit * digit
case 9 then unit + next_unit
=end
# rubocop:enable all

class RomanNumeral
  ONES = { unit: 'I', mid: 'V', next_unit: 'X' }.freeze
  TENS = { unit: 'X', mid: 'L', next_unit: 'C' }.freeze
  HUNDREDS = { unit: 'C', mid: 'D', next_unit: 'M' }.freeze
  THOUSANDS = { unit: 'M', mid: 'V̅', next_unit: 'X̅' }.freeze
  CHAR_LOOKUP = [ONES, TENS, HUNDREDS, THOUSANDS].freeze

  def initialize(number)
    @number = number
  end

  def to_roman
    digits = @number.to_s.chars
    digits.reverse!.map!.with_index do |digit, index|
      convert_digit(digit, index)
    end
    digits.reverse!.join
  end

  private

  def convert_digit(digit, index)
    unit = CHAR_LOOKUP[index][:unit]
    mid = CHAR_LOOKUP[index][:mid]
    next_unit = CHAR_LOOKUP[index][:next_unit]

    case digit.to_i
    when (1..3) then unit * digit
    when 4 then unit + mid
    when 5 then mid
    when (6..8) then mid + unit * (digit - 5)
    when 9 then unit + next_unit
    end
  end
end
