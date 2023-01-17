require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

class AssertKind < Minitest::Test
  # Write a minitest assertion that will fail if the class of value is not Numeric 
  # or one of Numeric's subclasses (e.g., Integer, Float, etc).
  def test_kind
    value = 4 # pass
    # value = 'a' # fail ; Expected "a" to be a kind of Numeric, not String.
    assert_kind_of(Numeric, value)
    [1, 1.0, 1r, Complex(1)].each { |num| assert_kind_of(Numeric, num) }
  end
end