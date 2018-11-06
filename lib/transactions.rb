require 'time'

# Transactions class which stores balance and deals with deposits & withdrawals.
class Transactions
  attr_reader :balance, :previous_transactions

  def initialize
    @balance = 0
    @previous_transactions = []
  end

  def deposit(amount, transaction_date)
    @balance += amount
    transaction_date = Time.now.strftime("%d %m %y")
    @previous_transactions
    .push(date: transaction_date,
          debited: nil,
          credited: amount,
          balance: @balance
          )
  end

  def withdraw(amount, transaction_date)
    @balance -= amount
    transaction_date = Time.now.strftime("%d %m %y")
    @previous_transactions
    .push(date: transaction_date,
          credited: nil,
          debited: amount,
          balance: @balance)

  end

end
