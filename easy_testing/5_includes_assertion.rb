require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

class TestInclude < Minitest::Test
  def test_include
    # Write a minitest assertion that will fail if the 'xyz' is not in the Array list.
    value = [] # fail
    # value = %w(abc def xyz) # pass
    
    assert_includes(value, 'xyz') # clearer, and issues better error message: expected [] to include 'xyz"
    assert_equal(true, value.include?('xyz')) # less clear, issues worse error message: expected: true, actual: false
  end
end