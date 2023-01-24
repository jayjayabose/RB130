# require 'simplecov'
# Simplecov.start
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

require 'pry'

class CashRegister_Test < Minitest::Test
  def setup
    # @register_initial_amt = 100
    # @transaction_paid_amt = 40
    
    @register = CashRegister.new(100)
    @transaction = Transaction.new(25)
    @transaction.amount_paid = 40
    
  end

  def test_accept_money
    previous_amt = @register.total_money
    return_value = @register.accept_money(@transaction)
    assert_equal(previous_amt + @transaction.amount_paid, @register.total_money)
    assert_equal(previous_amt + @transaction.amount_paid, return_value)
  end

  def test_change
    assert_equal(@transaction.amount_paid - @transaction.item_cost, @register.change(@transaction))
  end

  def test_give_receipt
    # out, err = capture_io { @register.give_receipt(@transaction) }
    # assert_equal("You've paid $#{@transaction.item_cost}.\n", out)
    assert_output("You've paid $#{@transaction.item_cost}.\n") { @register.give_receipt(@transaction) }
  end
end

# def change(transaction)
#   transaction.amount_paid - transaction.item_cost
# end


# def give_receipt(transaction)
#   puts "You've paid $#{transaction.item_cost}."
# end
