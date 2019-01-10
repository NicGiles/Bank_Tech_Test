Bank Tech Test in Ruby

Usage

Installation
To use this app first clone the app:

Git clone https://github.com/NicGiles/Bank_Tech_Test

Run Rspec within the root folder.
There should be 12 tests in total, all passing, which cover 100% code line coverage.

Using the bank account
To manually test the bank's functionality, perform the following :

$ irb
$ require './lib/transactions'
$ bank = Transactions.new

You now have a bank account which can be used to deposit and withdraw, as well as record transactions.

$ account.deposit(500)
$ account.withdraw(200)
$ account.deposit(2000)

You can then view a transactions log using the following:

$ bank.print_statement

$ #=> date || credit || debit  || balance
$ #=> 10/01/2019 || 500.00 ||  || 500.00
$ #=> 10/01/2019 ||  || 200.00 || 300.00
$ #=> 10/01/2019 || 2000.00 || || 2300.00

There is also an overdraft facility on the account, with a default value of 1000.

If a user attempts to withdraw enough money to take their account beyond their overdraft limit, they will receive the following warning.

account.withdraw(3301)

(Withdrawal blocked. You have reached your overdraft limit of -£1000)


The deposit and withdraw methods take one parameter each, the amount of money involved. The date is then autofiled by the account to the date of transaction.

The print_statement method takes no parameters.



User Stories
I withdrew the following User Stories from the brief
(found here - https://github.com/makersacademy/course/blob/master/individual_challenges/bank_tech_test.md)

As a bank user
So that I can deposit my money
I want to be able to deposit cash to the bank

As a bank user
So that I can withdraw money
I want to be able to withdraw cash from the bank

As a bank user
So that I can keep track of my previous transactions
I want to be able to see a printed statement with my previous deposits, withdrawals and ongoing balance

As a bank
So that I can keep track of my customer's money
I want to be able to store transactions in memory

