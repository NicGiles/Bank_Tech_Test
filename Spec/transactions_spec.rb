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
end
