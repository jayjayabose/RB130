# rubocop:disable all
=begin
PROBLEM
Takes
  a word and 
  a list of possible anagrams 
selects the correct sublist that contains the anagrams of the word.

For example, given the word "listen" and a list of candidates like "enlists", "google", "inlets", and "banana", the program should return a list containing "inlets". Please read the test suite for the exact rules of anagrams.



EXAMPLES / TEST CASES

Anagram.new('ant')
detector.match(%w(tan stand at)) 
# => tan


word: "listen" 
list: "enlists", "google", "inlets", and "banana", 
# =>  "inlets"


Orchestra
cashregister Carthorse radishes
Carthorse
#case insensitive

corn
corn dark Corn rank CORN cron park
cron

DATA STRUCTURES
String
Array (of String Elements)
Array

class Anagram
  #new(word) -> new_anagram_obj
    word is String 
    stores string
    no validation required

  #match(candidates) -> anagrams
    candidates is Array
      elements are Strings that are anagrams of word
    no validation required

ALGORITHM
  #new(word) -> new_anagram_obj
    word is String 
    stores string
    no validation required

    Input: String
    Output: Anagram
    Rules:
      save word to instance variabe
    
  #match(candidates)
    candidates is Array
      elements are Strings that are anagrams of word
    no validation required

    Input: Array
    Output: Array
    Rules:
      output is Array, of Strings that are anagrams
        return empty array if no anagrams
      anagram
        letters of candidate can be used to spell 'word'
          same total letter count
          same count of every letter
          case insensitive
        if candidate == word, it is not an anagram
  
    approach:
    init word_sorted_downcase
    init output: []
    iterate through each candidate
      skip if candidate lower case == @ workd lowercase
      reassign candidate: sorted and downcase (transform)
      if candidate is eqals word, push to output array (select)
    output

  #sort_dowcase(string)
    sort.downcase

=end
# rubocop:enable all

class Anagram
  def initialize(word)
    @word = word
  end

  def match(candidates)
    word_sorted_downcase = sort_downcase(@word)
    candidates.select do |candidate|
      next if @word.downcase == candidate.downcase
      word_sorted_downcase == sort_downcase(candidate)
    end
  end

  private

  def sort_downcase(str)
    str.downcase.chars.sort.join
  end

  def anagram?(word1, word2)  
    
end
