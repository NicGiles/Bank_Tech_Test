#Bank tech test

##How to run
: clone this repo
navigate to the folder in your command line
run *bundle install*
To run the tests enter *rspec* into the terminal

To manually walkthrough the app
go into the irb with the irb command
enter the command require './lib/transactions'
enter the command require 'bank = Transactions.new'

bank.deposit
You can then use the following commands:
 ```Ruby
 def deposit(amount)
   @balance += amount
   transaction_date = Time.now.strftime('%d %m %y')
   @previous_transactions << {
     date: transaction_date,
     debit: ' ',
     credit: amount,
     balance: @balance
   }
 end```

 

To

From this point on you've got everything needed to run the program on the irb shell. Please find the 'How to use' section for examples on how to run each command

How to install and run app.

// Git clone https://github.com/NicGiles/Bank_Tech_Test
Bundle Install



//To test the programme manually
Enter 'irb' into the command line and then enter the following steps;
require './lib/transactions'
bank = Transactions.new
bank.deposit(1000)
bank.deposit(2000)
bank.withdraw(500)
bank.print_statement



- Account statement: Voided transactions due to overdraft breach should be included on statement.
