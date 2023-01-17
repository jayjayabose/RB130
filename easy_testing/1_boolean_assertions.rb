require 'minitest/autorun'

class BooleanTest < Minitest::Test

  def test_odd?
    assert(3.odd?)
    # assert_equal(true, 3.odd?)
  end

end