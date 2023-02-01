# rubocop:disable all
=begin
PEDA 37m
1:08

PROBLEM
The diamond exercise takes as its input a letter, and 
outputs it in a diamond shape. 

Given a letter, 
it prints a diamond 
  starting with 'A', 
  with the supplied letter at the widest point.

Input: String
  Capital letters only.
Output: sting
Rules:
  Size = (2 x letter pos) - 1 
    (letter position: 1-index position of letter in alphabet)
  Row count = size
  Row width = size chars
  First row contains one 'A'.
  Last row contains one 'A'.
  All rows, except the first and last, have exactly two identical letters.  
  The top half has the letters in ascending order.
  The bottom half has the letters in descending order.
  The diamond is horizontally symmetric.
  The diamond is vertically symmetric.
  The letters form a diamond shape.
  The four corners (containing the spaces) are triangles.


EXAMPLES / TEST CASES

Diamond for letter 'A':
A

Diamond for letter 'B':
_A_
B*B
_A_

Diamond for letter 'C':
__A
_B*B
C***C
 B*B
  A

C: letter postion is 3, diamond size = 5


Diamond for letter 'E':
____A             i: 0 : 0* != 2i-1 
___B*B            i: 1 : 1* = 2i-1
__C***C           i: 2 : 3* = 2i-1
_D*****D          i: 3 : 5* = 2i-1
E*******E
 D     D
  C   C
   B B
    A  

D: letter postion is 5, diamond size = 5 (size + size - 1)

DATA STRUCTURE
Input: String
  String: row
  Array: collection of rows
Output: String
class Diamond
  ::make_diamond

ALGORITHM

Determine letter position: n
Generate 1..n rows, save to array
output rows 1..n, n-1..n

pseudocode
given: letter.upcase!
if A, return 'A'

init: size #(letter.ord - 64) * 2 - 1
init: rows = ('A'..letter).to_a.map {|l|...
   generate_string(l, size)
  }

reassign: rows = rows + rows[0..-1].reverse
rows.join
  

#generate_string(letter, size)
Input: 
  String: letter
  Number: size (number or chars in row)
Output String
Rules
  Output will be size chars
  if Letter is A return A centered
  else
    init row_index: letter_pos - 1
    row_center = letter + '*' * (i* 2 - 1) + 'letter
    center and return row_center + '\n'
=end
# rubocop:enable all
class Diamond
  def self.make_diamond(letter)
    return 'A' if letter.upcase!

    size = (letter.ord - 64) * 2 - 1
    unique_rows = ('A'..letter).to_a.map.with_index do |current_letter, row_index|
      generate_row(current_letter, size, row_index)
    end
    (unique_rows + unique_rows[0..-2].reverse).join
  end

  def self.generate_row(letter, size, row_index)
    row_middle = 'A'
    unless letter == 'A'
      row_middle = letter + (' ' * (row_index * 2 - 1)) + letter
    end
    row_middle.center(size) + "\n"
  end
end
