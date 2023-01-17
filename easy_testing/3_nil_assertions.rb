require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

class NilTest < Minitest::Test
  def test_nil_test
    # Write a minitest assertion that will fail if value is not nil.
    value = nil
    assert_nil(value)
    

    # additional tests
    # assert_nil(false)
    # assert_nil()
  end
end