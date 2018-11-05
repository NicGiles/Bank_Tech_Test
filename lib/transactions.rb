# Transactions class which stores balance and deals with deposits & withdrawals.
class Transactions
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def deposit(amount)
    @balance += amount
  end
end
