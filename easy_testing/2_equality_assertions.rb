require 'minitest/autorun'
require "minitest/reporters"

Minitest::Reporters.use!

class EqualityTest < Minitest::Test
# Write a minitest assertion that will fail if value.downcase does not return 'xyz'.
  # def setup
  #   @value = 'XYZ'
  # end

  def test_downcase
    value = 'XYZ'
    assert_equal('xyz', 'XYZ'.downcase)

    # additional tests
    assert_equal('xyz', 'xyz'.downcase)
    assert_equal('xyz', 'XyZ'.downcase)
  end
end