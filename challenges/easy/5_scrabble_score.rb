# rubocop:disable all
=begin
PEDA: 25min, C: 50 minutes (testing issues; solve quicky by stepping away and back to A;)

PROBLEM
Description
Write a program that, given a word, computes the Scrabble score for that word.


Input: String
Output: Integer
Rules:
 - given a word
 - each letter represents a tile
 - each tile has a value
 - sub vaues of all tiles in given word
 - case insenstive


EXAMPLES / TEST CASES

e.g.
CABBAGE
3 points for C
1 point for each A (there are two)
3 points for B (there are two)
2 points for G
1 point for E

3 + 2*1 + 2*3 + 2 + 1
=> 3 + 2 + 6 + 3
=> 5 + 9
=> 14

DATA STRUCTURES


class: Scrabble
  attribute
    @word 
  methods
    #initialize(String)
      string may be '
    #score() - returns score of argument supplied to constructor


ALGORITHM

#score
init Hash: POINTS_PER_TILE

given String: word

init: output = 0
iterate over each letter
  determine points per letter
  add points to output

return outout

#process_input
  handle nil
    nil => return '' # empty string does not raise error
  process string
    remove non-letter chars
    upcase
=end
# rubocop:enable all
class Scrabble
  TILES_POINTS = {
    ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T']	=> 1,
    ['D', 'G'] => 2,
    ['B', 'C', 'M', 'P'] =>	3,
    ['F', 'H', 'V', 'W', 'Y'] => 4,
    ['K'] => 5,
    ['J', 'X'] =>	8,
    ['Q', 'Z'] =>	10
  }.freeze

  def initialize(word)
    @word = process_word(word)
  end

  def score
    score = 0
    @word.each_char do |letter|
      tile_points_key = TILES_POINTS.keys.select { |k| k.include? letter }
      score += TILES_POINTS[tile_points_key.flatten!]
    end
    score
  end

  def self.score(word)
    Scrabble.new(word).score
  end

  private

  def process_word(word)
    return '' if word.nil?
    word.gsub(/\s/, '').upcase
  end
end
