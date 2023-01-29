# rubocop:disable all
=begin
PEDA: 30m, 23m Code

PROBLEM
Write a program that, g
iven a word, 
computes the Scrabble score for that word.


Input;
Output:
Rules:

EXAMPLES / TEST CASES

CABBAGE which has the following letters and point values:

3 points for C
1 point for each A (there are two)
3 points for B (there are two)
2 points for G
1 point for E
Thus, to compute the final total (14 points), we count:

3 + 2*1 + 2*3 + 2 + 1
=> 3 + 2 + 6 + 3
=> 5 + 9
=> 14

DATA STRUCTURES
String
Collection of some sort: letters and scores

A, E, I, O, U, L, N, R, S, T	1
D, G	2
B, C, M, P	3
F, H, V, W, Y	4
K	5
J, X	8
Q, Z	10


Integer

class: Scrabble
  #initialize(word) -> scrabble_obj 
  #score() -> scrabble_score
     

ALGORITHM
#initialize(word) -> scrabble_obj
  Input: String
  Output: new object
  Rules:
    word can be empty string
    word can be: " \t\n"
    word can be: nil
    capital letters and/or lowercase letters
    no errors raised
    saves word for later use  
      (change case?)

#score() -> scrabble_score
  Input: @word
  Output: Integer
  Rules:
      scores are case insensitive
      score is 0 or greater
      each letter has a point value
      word score is sum of point value of letters in the word
    

approach 1:
  init: LOOKUP {'AEIOULNRST' => 1, ..}
  init: KEYS array of keys in LOOKUP

  iterate through each char in word
        init key: key in KEYS where char is in key

        
approach 2
  init: LETTER_VALUES = { /AEIOULNRST/ => 1}
  init: Array: capitla letters in word
      handle nil

  iterate through k, v pairs in LOOKUP: map
    count chars in Array that match key * value

  return sum of resulting array

=end
# rubocop:enable all
class Scrabble
  LETTER_VALUES = {
    /[AEIOULNRST]/ =>	1,
    /[DG]/ =>	2,
    /[BCMP]/ => 3,
    /[FHVWY]/ =>	4,
    /K/ => 5,
    /[JX]/ =>	8,
    /[QZ]/ => 10
  }

  def initialize(word)
    @word = word || ''
  end

  def self.score(word)
    Scrabble.new(word).score
  end

  def score
    letters = @word.upcase.chars
    LETTER_VALUES.map do |regex, value|
      letters.count { |letter| letter =~ regex } * value
    end.sum
  end
end
