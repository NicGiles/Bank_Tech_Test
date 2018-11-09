require_relative 'transactions'

# Account statement which displays previous transactions in require format.
class Account_statement


  def account_line(transactions)
    puts "date || credit || debit || balance"
    transactions.reverse_each do |statement|
      if statement[:credit] == nil
   puts "#{statement[:date]} || #{statement[:credit]} || #{'%.2f'%statement[:debit]} || #{'%.2f'%statement[:balance]}"
 else
   puts "#{statement[:date]} || #{'%.2f'%statement[:credit]} || #{statement[:debit]} || #{'%.2f'%statement[:balance]}"
  end
  end
end

end
