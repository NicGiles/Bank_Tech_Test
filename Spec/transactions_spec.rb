require 'transactions'

RSpec.describe Transactions do

  subject { described_class.new(0) }

  it "should start with a balance of 0" do
     expect(subject.balance).to eq 0
  end
end
