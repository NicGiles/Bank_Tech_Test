Bank tech test

Tech Test ReadMe

Describe how you approached designing your solution to the problem.

I approached the problem by first creating a transactions class.
The aim was for this class to hold the deposit and withdrawal methods, which would then feed into the previous_transactions array.
The previous_transactions array was then exported to the account_statement class which was designed to take the previous transactions information and
print it in the desired format.

After some time attempting to print the formatted transactions I decided that perhaps I would be better off using a table gem, in this case table_print.

I was able to successfully print the first line of my previous_transactions and feel like with some more time this could become functional, but give the time pressure I decided to press on and use table_print in order to meet the submission deadline.

Current problems with the table_print method are that it is displayed in the incorrect order, and that the date is currently set to the live date of transaction.

Therefore the table doesn't exactly meet the specification. (See Screen shot file for demonstration)

Describe how to install and run your code and tests.

- Clone repo
- Run Bundle Install
- Follow walkthrough steps in screenshot file.


If I am to continue with the challenge I aim to complete the following:

 - Update account_statement class so that it correctly outputs previous transactions in the required format, along with associated tests. (Rather than only printing the latest transaction). I think the formatting element within the account line method should work, but it proved difficult to pass the method multiple transactions.
 - Update the deposit/withdraw methods so that the time can be passed as an argument and can therefore replicate the criteria.
 - Test the account_statement method with stubs of previous_transactions.
 - Test the time features




This program will replicate banking transactions.

It should be include the following features:

- Deposits, withdrawal.
- Account statement (date, amount, balance) printing.
- Data can be kept in memory (it doesn't need to be stored to a database or anything).

Given Criteria

Given a client makes a deposit of 1000 on 10-01-2012
And a deposit of 2000 on 13-01-2012
And a withdrawal of 500 on 14-01-2012
When she prints her bank statement
Then she would see

date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
