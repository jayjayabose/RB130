require 'Minitest/autorun'
require 'Minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class Transaction_Test < Minitest::Test
  def setup
    @register = CashRegister.new(100)
    @transaction = Transaction.new(25)
    # @transaction.amount_paid = 40    
  end

  def test_prompt_for_payment
    input = StringIO.new("40\n")
    output = StringIO.new()
    @transaction.prompt_for_payment(input: input, output: output)
    assert_equal(40, @transaction.amount_paid)
  end
end
