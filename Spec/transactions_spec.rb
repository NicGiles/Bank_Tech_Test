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
    subject.deposit(100, Time.now.strftime("%d %m %y"))
    expect(subject.previous_transactions).to eq [{
    date: Time.now.strftime("%d %m %y"), credited: 100, debited: nil, balance: 100 }]
  end

  it 'should record recent debit transactions' do
    subject.withdraw(200, Time.now.strftime("%d %m %y"))
    expect(subject.previous_transactions).to eq [{
    date: Time.now.strftime("%d %m %y"), credited: nil, debited: 200, balance: -200 }]
  end

  it 'should record recent credit transactions' do
    subject.deposit(100, Time.now.strftime("%d %m %y"))
    expect(subject.previous_transactions).to eq [{
    date: Time.now.strftime("%d %m %y"), credited: 100, debited: nil, balance: 100 }]
  end

  it 'should record multiple transactions' do
    subject.deposit(2000, Time.now.strftime("%d %m %y"))
    subject.withdraw(200, Time.now.strftime("%d %m %y"))
    subject.withdraw(500, Time.now.strftime("%d %m %y"))
    expect(subject.previous_transactions).to eq [{
    date: Time.now.strftime("%d %m %y"), credited: 2000, debited: nil, balance: 2000 },{
    date: Time.now.strftime("%d %m %y"), credited: nil, debited: 200, balance: 1800 },{
    date: Time.now.strftime("%d %m %y"), credited: nil, debited: 500, balance: 1300 }]
  end

end
