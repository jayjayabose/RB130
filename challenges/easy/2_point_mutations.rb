# rubocop:disable all
=begin
23 minutes PEDA
6 minutes Coding

PROBLEM
Description;
The Hamming distance is only defined for sequences of equal length. 
If you have two sequences of unequal length, 
you should compute the Hamming distance over the shorter length.



Input
Output
Rules



EXAMPLES / TEST CASES

#1
GAGCCTACTAACGGGAT
CATCGTAATGACGGCCT
^ ^ ^  ^ ^    ^^

The Hamming distance between these two DNA strands is 7.

DATA STRUCTURES
Class: DNA
  Attributes
  Methods
    #initialize
      ('')
      (String)
    #hamming_distance
      ('')
      (String)
      Return: Integer (0 or greater)

ALGORITHM
Class: DNA
  Attributes
    Strand (String) -
  Methods
    #initialize
      Input: String
        string may be empty
      Rules
        assign Stran to argument

    #hamming_distance
      Input: String
        string may be empty
      Output: Integer
        0 or greater
      Rules
        compare characters in strand and argument
        compare characters at same index
        compare until end of one string is reached
        if characters are different += to distance

      Algo
        distance = 0
        i = 0
        loop
          break if strand[i].nil? || other_strand[i].nil?
          distance += 1 if not equal
          i +=1
=end
# rubocop:enable all
class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    distance = 0
    i = 0

    loop do
      break if @strand[i].nil? || other_strand[i].nil?
      distance += 1 unless @strand[i] == other_strand[i]
      i += 1
    end

    distance
  end
end
