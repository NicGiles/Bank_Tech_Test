require 'transactions'

RSpec.describe Transactions do
  subject { described_class.new }

  it 'should start with a balance of 0' do
    expect(subject.balance).to eq 0
  end

  it 'should allow customer to deposit their hard earned money' do
    subject.deposit(100)
    expect(subject.balance).to eq 100
  end

  it 'should allow customer to withdraw their previously deposited money' do
    subject.deposit(1000)
    subject.withdraw(500)
    expect(subject.balance).to eq 500
  end

  it 'should record recent debit transactions' do
    subject.withdraw(200)
    expect(subject.previous_transactions).to eq [{ balance: -200, credit: ' ', date: '06 11 18', debit: 200 }]
  end

  it 'should record recent credit transactions' do
    subject.deposit(200)
    expect(subject.previous_transactions).to eq [{ balance: 200, credit: 200, date: '06 11 18', debit: ' ' }]
  end

  it 'should record balance across multiple transactions' do
    subject.deposit(2000)
    subject.withdraw(200)
    subject.withdraw(500)
    expect(subject.previous_transactions).to eq [{ balance: 2000, credit: 2000, date: Time.now.strftime('%d %m %y'), debit: ' ' }, { balance: 1800, credit: ' ', date: Time.now.strftime('%d %m %y'), debit: 200 }, { balance: 1300, credit: ' ', date: Time.now.strftime('%d %m %y'), debit: 500 }]
  end
end
