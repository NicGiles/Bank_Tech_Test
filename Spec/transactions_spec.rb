require 'transactions'
require 'Timecop'

RSpec.describe Transactions do
  subject { described_class.new(statement) }

  let(:statement) { double :statement, account_line: 'printed statement' }

  transaction_time = Time.now.strftime('%d %m %y')
  Timecop.freeze(transaction_time)

  describe "Deposit" do

  it 'should allow customer to deposit their hard earned money' do
    subject.deposit(100)
    expect(subject.balance).to eq 100
  end

  it 'should record recent credit transactions' do
    expect(subject.deposit(200)).to eq [{ balance: 200, credit: 200, date: transaction_time, debit: ' ' }]
  end
end

describe "Withdraw" do
it 'should allow customer to withdraw their previously deposited money' do
    subject.deposit(1000)
    subject.withdraw(500)
    expect(subject.balance).to eq 500
  end

  it 'should record recent debit transactions' do
    expect(subject.withdraw(200)).to eq [{ balance: -200, credit: ' ', date: transaction_time, debit: 200 }]
  end
end

describe "Deposit & Withdraw" do

it 'should record transaction history across multiple transactions' do
  subject.deposit(2000)
  subject.withdraw(200)
  expect(subject.withdraw(500)).to eq [{ balance: 2000, credit: 2000, date: transaction_time, debit: ' ' }, { balance: 1800, credit: ' ', date: transaction_time, debit: 200 }, { balance: 1300, credit: ' ', date: transaction_time, debit: 500 }]
end
end

describe 'Print statement' do

it 'calls account_line method on the statement instance' do
  expect(statement).to receive(:account_line).with(anything)
  subject.print_statement
end

it 'calls account_line method on the statement instance and returns account_line' do
  expect(statement).to receive(:account_line).and_return('printed statement')
  subject.print_statement
  end
end
end
