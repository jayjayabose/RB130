=begin
PROBLEM
PEDA: 35m + 15m

Description
Write a program that can generate the lyrics of the 99 Bottles of Beer song.
 See the test suite for the entire song.

- 


EXAMPLES / TEST CASES

"99 bottles of beer on the wall, 99 bottles of beer.\n" \
      "Take one down and pass it around, 98 bottles of beer on the wall.\n" \
      "\n" \

            "98 bottles of beer on the wall, 98 bottles of beer.\n" \
      "Take one down and pass it around, 97 bottles of beer on the wall.\n"

  regular verse: 
    1: count line: {i} .. {i}, 
    2: pass it around line; {i-1}}

  last verse: 
    1: countline: {'no more'} {'no more'}, 
    2: go to store line: {99}


DATA STRUCTURES
Integer inputs
  will be iterating through number range
String outputs
  probably building an output string

class: BeerSong
  methods
    ::verse(Integer start) -> returns one verse, if zero then last verse
    ::verses(Integer start, Integer end) -> returns one or more verses

ALGORITHMS
::verse(Integer start)
  Output String
  Rules
    outputs one verse for integer start
    if zero, output end verse

invoke ::verses(Integer start, 0) 

::verses(Integer start, Integer end) 
Description
  takes two integers
  returns one or more verses
  returns one verse if start == end

Output: String
Rules:

  args are integers
  start >= 0
  end >= 0
  end is <= start
  if start == end, output one verse
  display verses for start .. end, descending
    start .. 1: regular versus
    0: end verse
  if start or end is 0, dispay "end" verse

  Output is composed of verses
  verses have two ines
    regular verse (see example)
    end verse (see example)


pseudocode
  given: start, end
  init: lyrics = ''
  init: reg_verse_line_1 
  init: reg_verse_line_2  


  iterate with index from start to end: (start .. end).to_a.each
    if index is 0
      init: end_verse                     # => fixed
      concatenate final verse to output
    else
      init: end_verse_line_1 : plural
      init: end_verse_line_2 : plural
    if index is 2
        #  reg_line one: "2 bottle'          # => plural 
        reg_line_two; "1 bottle'          # => singular
    if index is 1
        reg_line one: "1 bottle'          # => singular
        reg_line_two; "no more bottles"   # => no more    
    init: verse      
    concatenate final verse to output
  output
=end

class BeerSong
  def self.verse(start_num)
    self.verses(start_num, start_num)
  end

  def self.lyrics
    self.verses(99)
  end
  
  #  -> returns one or more verses
  def self.verses(start_num, end_num=0)
    lyrics = ''

    (end_num..start_num).to_a.reverse.each do |count|
      if count == 0
        end_verse_line_1 = "No more bottles of beer on the wall, no more bottles of beer.\n"
        end_verse_line_2 = "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
        lyrics += end_verse_line_1 + end_verse_line_2
      else
        current_bottles = count.to_s + " bottles"
        next_bottles = (count - 1).to_s + " bottles"
        pronoun = 'one'
        if count == 2
          next_bottles = '1 bottle'
        elsif count == 1
          current_bottles = '1 bottle'
          next_bottles = 'no more bottles'
          pronoun = 'it'
        end

        reg_verse_line_1 = "#{current_bottles} of beer on the wall, #{current_bottles} of beer.\n"
        reg_verse_line_2 = "Take #{pronoun} down and pass it around, #{next_bottles} of beer on the wall.\n"
        lyrics += reg_verse_line_1 + reg_verse_line_2
        lyrics += "\n" unless count == end_num
      end
    end
    lyrics  
  end
end

# puts BeerSong.verses(3,0) # => 3, 2, 1, 0
# puts BeerSong.verses(3,3) # => 3
# puts BeerSong.verses(0,0) # => 0

# line 43 test_a_couple_verses
# expected = "99 bottles of beer on the wall, 99 bottles of beer.\n" \
#       "Take one down and pass it around, 98 bottles of beer on the wall.\n" \
#       "\n" \
#       "98 bottles of beer on the wall, 98 bottles of beer.\n" \
#       "Take one down and pass it around, 97 bottles of beer on the wall.\n"
# actual = BeerSong.verses(99, 98) 
# p actual == expected
# p expected
# p "---"
# p actual