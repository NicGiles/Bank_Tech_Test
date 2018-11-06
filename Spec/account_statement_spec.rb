require 'account_statement'

RSpec.describe Account_statement do
  subject { described_class.new(date: '06 11 2018', debit: nil, credit: 2000, balance: 2000) }

  it 'should display one previous transactions in the correct format(see below)' do
    expect(subject.account_line).to eq '06 11 2018 || 2000 || || 2000'
  end
end

# Correct format for printer

# date || credit || debit || balance
# 14/01/2012 || || 500.00 || 2500.00
# 13/01/2012 || 2000.00 || || 3000.00
# 10/01/2012 || 1000.00 || || 1000.00
