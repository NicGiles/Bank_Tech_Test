require_relative 'transactions'

# Account statement which displays previous transactions in require format.
class Account_statement

  def account_line(transactions)
    puts "date || credit || debit || balance"
    transactions.reverse_each do |statement|
    puts "#{statement[:date]} || #{statement[:credit]} ||#{statement[:debit]} || #{statement[:balance]}"
    end
  end
end
