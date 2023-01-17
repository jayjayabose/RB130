require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

class EmptyObjectTest < Minitest::Test
  def test_empty
    # Write a minitest assertion that will fail if the Array list is not empty.
    value = []
    assert_empty(value)

    # additional tests
    assert_empty(nil)
    # assert_empty([1])
    
  end

  def test_empty_2
    assert_empty([1])    
  end  
end