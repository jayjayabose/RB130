# rubocop:disable all
=begin
PEDA: 45m; C: 29

pickup notes
 - pseudo code for #convert is close
PROBLEM

EXAMPLES / TEST CASES
1990 is MCMXC:
  1000=M
  900=CM
  90=XC

2008 is MMVIII:  
2000=MM
8=VIII

DATA STRUCTURES
Integer
String
Hash

class: RomanNumeral
  #new(num) -> roman_numeral_obj
    saves Integer num for later use
    raise no errors
  #to_roman() -> roman_numeral
    returns a String representing a roman numeral


ALGORITHMS

#to_roman()
  Input: @number
  Output: String 
  pseudocode
  separate @number array of Integers # => e.g. '1990'
    @number -> string
    -> chars
    -> to_i
    # =>e.g. [1, 9, 9, 0]
 
  map!.with index |digit, i|
    init position: length - i
    convert_digit(digit, position) 
  # join and output trainsformed array


#convert(digit, place value) -> roman_chars
input: String, Integer 
output: String
rules
  digit is 0-9
  place value is an Integer 1-4
    4; thousands
    1: ones
pseudocode  
  init: placevalue = PLACE_VALUES[digit]
  init one, five, ten = placevalue['one'], placevalue['five'], placevalue['ten'],
  reassign: digit.to_i
  
  case digit
    0..3; one * digit
    4; one + five
    5: five
    6..8: five + one * digit
    9: one + ten

=end
# rubocop:enable all
class RomanNumeral
  ONES = { 'one' => 'I', 'five' => 'V', 'ten' => 'X' }
  TENS = { 'one' => 'X', 'five' => 'L', 'ten' => 'C' }
  HUNDREDS = { 'one' => 'C', 'five' => 'D', 'ten' => 'M' }
  THOUSANDS = { 'one' => 'M', 'five' => 'V̅', 'ten' => 'X̅' }
  POSITION_PLACE_VALUES = {
    4 => THOUSANDS,
    3 => HUNDREDS,
    2 => TENS,
    1 => ONES
  }

  def initialize(number)
    @number = number
  end

  def to_roman
    digits = @number.to_s.chars.map!(&:to_i)
    digits.map!.with_index do |digit, i|
      position = digits.length - i
      convert_digit(digit, position)
    end
    digits.join
  end

  private

  def convert_digit(digit, position)
    place_value = POSITION_PLACE_VALUES[position]
    one, five, ten = place_value.values
    case digit
    when 0..3 then one * digit
    when 4 then one + five
    when 5 then five
    when 6..8 then five + one * (digit - 5)
    when 9 then one + ten
    end
  end
end
