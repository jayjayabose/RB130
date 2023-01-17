require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!


class Refutations < Minitest::Test
  # Write a test that will fail if 'xyz' is one of the elements in the Array list:


  def test_refutations
    list = ['xyz'] # => FAIL Expected ["xyz"] to not include "xyz".
    list = [] # PASS
    refute_includes(list, 'xyz')        
  end
end