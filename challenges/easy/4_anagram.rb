# rubocop:disable all
=begin
PEDA: 20 minutes; C: 19 minutes

PROBLEM
Description

Write a program that takes a word and a list of possible anagrams and 
selects the correct sublist that contains the anagrams of the word.

Input: 
  String: word
  Array of Strings; candidates
Output:
  Array of Strings: subset of strings that are anagrams

Rules
  candidate is anagram if
    candidate is not same as word
    it can be spelled with using all letters of word once - case insensitive
    and count of captial letters match (can be differerent letters)    
  return [] if no anagrams

EXAMPLES / TEST CASES

given the word "listen" and 
candidates: "enlists", "google", "inlets", and "banana", 
the program should return a list containing "inlets". 

DATA STRUCTURES
class: Anagram
methods;
  #initialize: takes String
    assign @upcase: count of upper case Chars in argument
    assign @sorted_downcase: to lowercase, sorted letters of argument

  #match: takes an array of Strings
    returns array of Strings that are anagrams

ALGORITHM

#match(candiates)
Given Array of Strings; candidates 

iterate through each candidate
  reject if candidate == word
  regject if candidate length is not equal to word length

  init upper_case to count of upper case letters
  init sorted_downcase_candidate: downcase and sort letters in string
  add to candiate to output if
    @letters == sorted_downcase_candidate
    and
    @upcase_count == 
=end
# rubocop:disable all
class Anagram
  def initialize(word)
    @word = word.downcase
  end

  def match(candidates)
    word_downcase_sorted = downcase_sort(@word)
    candidates.each_with_object([]) do | candidate, anagrams|
      next if @word == candidate.downcase || @word.length != candidate.length
      downcase_sorted_matched = word_downcase_sorted == downcase_sort(candidate)
      anagrams << candidate if downcase_sorted_matched
    end
  end

  private
  
  def downcase_sort(str)
    str.downcase.chars.sort.join
  end
end