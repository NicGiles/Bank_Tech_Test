Bank tech test

Tech Test ReadMe

- Git clone https://github.com/NicGiles/Bank_Tech_Test
- Bundle Install

- To Test Criteria Using Feature Test: Enter Rspec Spec/feature_test_walkthrough_spec.rb into command line.
This test is designed to replicate the conditions set out in the original project ReadMe, such that the programme outputs the following;
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00

- To test the programme manually
- Enter 'irb' into the command line and then enter the following steps;
- require './lib/transactions'
- bank = Transactions.new
- bank.deposit(1000, 10/01/2012)
- bank.deposit(2000, 13/01/2012)
- bank.withdraw(500, 14/01/2018)
- statement = Account_statement.new(bank.previous_transactions)
- statement.account_line

You should see the following

date || credit || debit || balance
07 11 18 ||   ||500 || 2500
07 11 18 || 2000 ||  || 3000
07 11 18 || 1000 ||  || 1000

Limitations:

- Programme is set up to enter the current date upon each transaction, hence the 07/11/18 (today's date) seen above.
- Programme is missing the 2 decimal formatting. This was due to issues when attempting to format 'nil' for deposits and withdrawals.


Future Plans:

- As well as the two issues mentioned above I plan to implement the following features;

- Edge Cases. Should be able to check formatting of user entry.
- Overdraft. Users should be able to have a negative bank balance, up until the limit of their overdraft.
