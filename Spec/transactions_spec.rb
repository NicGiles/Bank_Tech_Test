require 'transactions'

RSpec.describe Transactions do
  subject { described_class.new }

  it 'should start with a balance of 0' do
    expect(subject.balance).to eq 0
  end

  it 'should allow customer to deposit their hard earned money' do
    subject.deposit(100, 18/02/2018)
    expect(subject.balance).to eq 100
  end

  it 'should allow customer to withdraw their previously deposited money' do
    subject.deposit(1000, 18/02/2018)
    subject.withdraw(500, 18/02/2018)
    expect(subject.balance).to eq 500
  end

  it 'should record recent credit transactions' do
    subject.deposit(100, 18/02/2018)
    expect(subject.previous_transactions).to eq [{
    date: '18/02/2018', credited: 100, debited: nil, balance: 100 }]
  end

  it 'should record recent debit transactions' do
    subject.withdraw(200, 19/02/2018)
    expect(subject.previous_transactions).to eq [{
    date: '19/02/2018', credited: nil, debited: 200, balance: -200 }]
  end

end
