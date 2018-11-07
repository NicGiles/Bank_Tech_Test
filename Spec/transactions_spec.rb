require 'transactions'
require 'Timecop'

RSpec.describe Transactions do
  subject { described_class.new }

  transaction_time = Time.now.strftime('%d %m %y')
  Timecop.freeze(transaction_time)

  it 'should allow customer to deposit their hard earned money' do
    subject.deposit(100, transaction_time)
    expect(subject.balance).to eq 100
  end

  it 'should allow customer to withdraw their previously deposited money' do
    subject.deposit(1000, transaction_time)
    subject.withdraw(500, transaction_time)
    expect(subject.balance).to eq 500
  end

  it 'should record recent debit transactions' do
    subject.withdraw(200, transaction_time)
    expect(subject.previous_transactions).to eq [{ balance: -200, credit: ' ', date: transaction_time, debit: 200 }]
  end

  it 'should record recent credit transactions' do
    subject.deposit(200, transaction_time)
    expect(subject.previous_transactions).to eq [{ balance: 200, credit: 200, date: transaction_time, debit: ' ' }]
  end

  it 'should record balance across multiple transactions' do
    subject.deposit(2000, transaction_time)
    subject.withdraw(200, transaction_time)
    subject.withdraw(500, transaction_time)
    expect(subject.previous_transactions).to eq [{ balance: 2000, credit: 2000, date: transaction_time, debit: ' ' }, { balance: 1800, credit: ' ', date: transaction_time, debit: 200 }, { balance: 1300, credit: ' ', date: transaction_time, debit: 500 }]
  end
end
