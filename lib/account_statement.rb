require_relative 'transactions'

# Account statement which displays previous transactions in require format.
class Account_statement
  attr_reader :previous_transactions

  def initialize(previous_transactions)
    @previous_transactions = previous_transactions
  end

  def account_line
    puts "date || credit || debit || balance"
    @previous_transactions.each do |statement|
    puts "#{statement[:date]} || #{statement[:credit]} ||#{statement[:debit]} || #{statement[:balance]}"
    end
end

end
