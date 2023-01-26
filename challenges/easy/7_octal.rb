# rubocop:disable all
=begin
PEDA: 17m; 32m (codign was fast; tests revealed I did not understand base 8)

PROBLEM
Description

Implement octal to decimal conversion. 
Given an octal input string, your program should produce a decimal output. 
Treat invalid input as octal 0.

Note: Implement the conversion yourself. 
Don't use any built-in or library methods that perform the necessary conversions 
for you. In this exercise, the code necessary to perform the conversion 
  is what we're looking for.


EXAMPLES / TEST CASES

DATA STRUCTURES
class: Octal
  methods
    #initialize(String) -> stores argument
    #to_decimal -> returns base 10 number

ALGORITHM
#initialize(String) -> stores argument
  Input;  String (represents octal number)
  Output: -
  Rules:
    store any value given as @octal_string


#to_decimal -> returns base 10 number    
  Input;  String (@octal_string
  Output: Integer (base 10 number)
  Rules:
    # return 0 if @octal_string is invalid
      octal_string.to_i.to_s == octal_string

    init exponent
      octal_string.length - 1
     
    init sum = 0
    iterate through each char in octal_string
      init digit: convert char to number 
      add to sum: digit * 8 ** exponent
      exponent -= 1
    sum

   Special Cases
    leading zero: 011 #=> 9      line 74
    6789 is invalid => 0 (why?)  line 64
    8 is invalid => 0             line 54result is < 1,
    9 is invalid => 0           line 59
=end
# rubocop:enable all
class Octal
  def initialize(input)
    @octal_string = input
  end

  def to_decimal
    return 0 if @octal_string =~ /[^0-7]/

    exponent = @octal_string.length - 1
    sum = 0
    @octal_string.each_char do |char|
      digit = char.to_i
      sum += digit * 8**exponent
      exponent -= 1
    end
    sum
  end
end
