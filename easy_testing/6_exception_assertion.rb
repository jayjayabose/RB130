require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

class NoExperienceError < TypeError; end

class Employee
  def hire
    raise NoExperienceError
  end
end

class ExceptionAssertion < Minitest::Test

  # Write a minitest assertion that will fail unless employee.hire raises a NoExperienceError exception.
  def test_exception_assertion
    assert_raises(NoExperienceError) { Employee.new.hire }
  end
end