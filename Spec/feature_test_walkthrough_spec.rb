require 'account_statement'

#This is a walkthrough of the Bank Tech Test. By running the following Spec test the Tech_Test criteria should be met.



RSpec.describe Account_statement do

  let(:bank) {double :bank, previous_transactions: [{date: '10/01/2012', debit: nil, credit: 1000.00, balance: 1000.00},{date: '13/01/2012', debit: nil, credit: 2000.00, balance: 3000.00},{date: '14/01/2012', debit: 500.00, credit: nil, balance: 1000.00}] }

  subject { described_class.new(bank.previous_transactions) }

  it 'should display previous transactions in the correct format(see below)' do
    expect {subject.account_line}.to output("date || credit || debit || balance\n14/01/2012 ||  ||500.0 || 1000.0\n13/01/2012 || 2000.0 || || 3000.0\n10/01/2012 || 1000.0 || || 1000.0\n"
).to_stdout

end
end

# date || credit || debit || balance
# 14/01/2012 || || 500.00 || 2500.00
# # 13/01/2012 || 2000.00 || || 3000.00
# # 10/01/2012 || 1000.00 || || 1000.00
