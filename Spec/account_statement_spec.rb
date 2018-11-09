require 'account_statement'
require 'Timecop'

RSpec.describe Account_statement do

  transaction_time = Time.now.strftime('%d %m %y')
  Timecop.freeze(transaction_time)


  previous_credit = [{date: transaction_time, debit: nil, credit: 1000, balance: 1000}]
  previous_debit = [{date: transaction_time, debit: 1000, credit: nil, balance: -1000}]
  no_transactions = []

  subject { described_class.new }

  describe "Account Statement" do

    it 'should display a blank statement if called before any transactions' do
      expect {subject.account_line(no_transactions) }.to output("date || credit || debit || balance\n").to_stdout
    end


    it 'should display previous transactions in the correct format(see below)' do
      expect {subject.account_line(previous_credit) }.to output("date || credit || debit || balance\n#{transaction_time} || 1000.00 ||  || 1000.00\n").to_stdout
    end

    it 'should display previous transactions in the correct format(see below)' do
      expect {subject.account_line(previous_debit) }.to output("date || credit || debit || balance\n#{transaction_time} ||  || 1000.00 || -1000.00\n").to_stdout
    end
  end
end
