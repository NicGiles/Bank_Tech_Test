require 'account_statement'
require 'Timecop'

RSpec.describe Account_statement do

  transaction_time = Time.now.strftime('%d %m %y')
  Timecop.freeze(transaction_time)

  previous_transactions = [{date: transaction_time, debit: nil, credit: 2000, balance: 2000}]

  subject { described_class.new }

  it 'should display previous transactions in the correct format(see below)' do
    expect {subject.account_line(previous_transactions) }.to output("date || credit || debit || balance\n#{transaction_time} || 2000 || || 2000\n").to_stdout
end
end
