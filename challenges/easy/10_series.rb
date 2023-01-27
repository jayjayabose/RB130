# rubocop:disable all
=begin
35 m PEDA DONE
40 m CODING done
--

PROBLEM
take a string of digits and 
return all the possible consecutive number series 
  of a specified length in that string.

Input: String (digits)
Output: Array (subarrays with integer elements)
Rules:
  if no argument
    return array of subarrays, each with one digit

  if argument > digits.length or < 2
    raise ArgumentError
  
  subarrays will contain size digits
  begin at index 0, create subarray, add to output
  advance index +1 create subarray, add to output
  until end of subarray includes last digit 
  
  return array of subarrays
  

EXAMPLES / TEST CASES
Series.new('92834')
Series.new('01234') #=> [[0], [1], [2], [3], [4]]
series.slices(1)
  number default = 1

Series.new('98273463')
series.slices(2) # => expected = [[9, 8], [8, 2], [2, 7], [7, 3], [3, 4], [4, 6], [6, 3]]
98273463
98 
 82
  27
   73
    36
     63

01234     
012
 123
  234
series.size = 5
slice_length= = 3
end_index = 2

DATA STRUCTURES
String
  move along string, char by char
  until 
Array
  Subarrays
    Integers

class: Series
  #initialize(String) -> save string to state
  #slice([slice_length]) - returns array of subarrays    

ALGORITHM
#slice([slice_length])
given: String, series
given: Integer, slice_length

if slice_length is one
  return array of subarrays, each with one digit

if argument > series.length or < 2
  raise ArgumentError
  

init Array: output  
init end_index: series length - slice_length
step through chars in series, from 0 .. series.length - slice_length, with index
  init String: series_slice:  i... i + slice_lengh
  push to output array, chars, in series slice, converted to integer

output

=end
# rubocop:enable all
class Series
  def initialize(series)
    @series = series
  end

  def slices(slice_length = 1)
    return @series.chars.map { |char| [char.to_i] } if slice_length == 1
    validate_argument(slice_length)

    output = []
    end_index = @series.length - slice_length
    (0..end_index).each do |i|
      series_slice = @series[i...i + slice_length]
      output << series_slice.chars.map(&:to_i)
    end
    output
  end

  private

  def validate_argument(slice_length)
    # rubocop:disable Layout/LineLength:
    if slice_length > @series.length; raise ArgumentError, "Slice is longer than series"; end
    if slice_length < 2; raise ArgumentError, "Slice must be an integer 2 or greater"; end
    # rubocop:enable Layout/LineLength:
  end
end
