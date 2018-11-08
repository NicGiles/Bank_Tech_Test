require 'time'
require_relative 'account_statement'

# Transactions class which stores balance and deals with deposits & withdrawals.
class Transactions
  attr_reader :balance

  def initialize(statement = Account_statement.new)
    @balance = 0
    @previous_transactions = []
    @statement = statement
  end

  def print_statement
    @statement.account_line(@previous_transactions)
  end

  def deposit(amount)
    @balance += amount
    transaction_date = Time.now.strftime('%d %m %y')
    @previous_transactions << {
      date: transaction_date,
      debit: ' ',
      credit: amount,
      balance: @balance
    }
  end

  def withdraw(amount)
    @balance -= amount
    transaction_date = Time.now.strftime('%d %m %y')
    @previous_transactions << {
      date: transaction_date,
      credit: ' ',
      debit: amount,
      balance: @balance
    }
  end
end
