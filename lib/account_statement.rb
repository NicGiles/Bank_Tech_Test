require_relative 'transactions'

# Account statement which displays previous transactions in require format.
class Account_statement
  attr_reader :previous_transactions

  def initialize(previous_transactions)
    @previous_transactions = previous_transactions
  end

  def account_line
    pt = @previous_transactions
    puts "#{pt[:date]} || #{pt[:credit]} ||#{pt[:debit]} || #{pt[:balance]}"
  end
end
