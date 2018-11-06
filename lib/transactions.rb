require 'time'
require 'table_print'
require_relative 'account_statement'

# Transactions class which stores balance and deals with deposits & withdrawals.
class Transactions
  attr_reader :balance, :previous_transactions

  def initialize
    @balance = 0
    @previous_transactions = []
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

  def account_statement
    @previous_transactions.reverse
    tp @previous_transactions, :date, :credit, :debit, :balance
  end
end
