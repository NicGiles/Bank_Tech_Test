require 'time'

# Transactions class which stores balance and deals with deposits & withdrawals.
class Transactions
  attr_reader :balance, :previous_transactions

  def initialize
    @balance = 0
    @previous_transactions = []
  end

  def deposit(amount, date)
    @balance += amount
    @previous_transactions
    .push(date: '18/02/2018',
          credited: amount,
          debited: nil,
          balance: @balance)
  end

  def withdraw(amount, date)
    @balance -= amount
  end

end
