require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

class List
  def process
    self
  end
end

class AssertSame < Minitest::Test
  # Write a test that will fail if list and the return value of list.process are different objects.

  def test_same
    list = List.new
    assert_same(list, list.process)
  end
end