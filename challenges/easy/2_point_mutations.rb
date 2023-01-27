# rubocop:disable all

=begin
20m PEDA
15m Coding

PROBLEM
Description: calculate the Hamming distance between two DNA strands

The Hamming distance is only defined for sequences of equal length. 
If you have two sequences of unequal length, 
  compute the Hamming distance over the shorter length.

EXAMPLES / TEST CASES
GAGCCTACTAACGGGAT
CATCGTAATGACGGCCT
^ ^ ^  ^ ^    ^^
The Hamming distance between these two DNA strands is 7.


assert_equal 0, DNA.new('GGACTGA').hamming_distance('GGACTGA')
# no diff => 0

assert_equal 1, DNA.new('GGACG').hamming_distance('GGTCG')
GGACG
GGTCG
  ^ 

assert_equal 3, DNA.new('AAACTAGGGG').hamming_distance('AGGCTAGCGGTAGGAC')
AAACTAGGGG
AGGCTAGCGG #  TAGGAC
 ^^    ^    # => 3

DATA STRUCTURES
class: DNA
  #iniitialize(strand) -> dna_ob
    returns a new DNA object
    save strand for later use
    no validation 
    strand can be empty string
  #hamming_distance(other_strand) -> distance
    returns Integer, 0 or greater

ALGORITHM

#hamming_distance(other_strand)
Input: String, other_strand; String, @strand
Output: Integer
Rules
  no validation
  either string can be empty
  output is zero or greater
  if sequences are uneven length compare only chars in shorter

init hamming distance to 0
find shorter string
iterate through each char of shorter string
compare char in short string and long string at each index
  if not equal increase hamming distane by one


pseudocode:
init: short string
    compare legths, assign
init: long string
    compare short_string object

init array of short string chars
map array with index
    compare short char
    long char at index
    if not equal, 1
    else 0
return sum of array



=end
# rubocop:enable all
class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    short, long = [@strand, other_strand].sort_by!(&:length)
    
    # v2
    # short.chars.map.with_index do |char, i|
    #   char == long[i] ? 0 : 1
    # end.sum
    
    #v3
    (0...short.length).to_a.count { |i| short[i] != long[i] }
  end
end
