require 'account_statement'

RSpec.describe Account_statement do
  subject { described_class.new }

  let(:previous_transactions)  {double :previous_transactions, :date=>"06 11 18", :debited=>nil, :credited=>2000, :balance=>2000}

  it 'should display previous transactions in the correct format(see below)' do
    expect(subject.account_statement).to eq 'date || credit || debit || balance 14/01/2012 || || 500.00 || 2500.00'
  end
end

#Correct format for printer

# date || credit || debit || balance
# 14/01/2012 || || 500.00 || 2500.00
# 13/01/2012 || 2000.00 || || 3000.00
# 10/01/2012 || 1000.00 || || 1000.00

# let(:jack)      {double :jack, name: "Jack"}
# let(:jill)      {double :jill, name: "Jill"}
# subject { described_class.new(jack, jill) }
