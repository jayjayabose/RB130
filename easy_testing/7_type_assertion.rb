require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

class TypeAssertion < Minitest::Test
  # Write a minitest assertion that will fail if value is not an instance of the Numeric class exactly. 
  # value may not be an instance of one of Numeric's superclasses.
  def test_type_assertion
    # value = 'a'
    # value = Numeric.new # pass
    value = 4 # => fail; Expected 4 to be an instance of Numeric, not Integer.
    assert_instance_of(Numeric, value)
  end
end