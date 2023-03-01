# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
ruby-2.5.3

* System dependencies
# mysql,ruby,rails,scheduler,worker,git

* Steps to run the application

* Step 1 : git clone git@github.com:priyankayabx/sequra.git

* Step 2: cd sequra_test

* Step 3 : git checkout orders

* Step 4: Database creation (although database is in the attachment of the mail)
# run the below command 
# "rake db:setup"
# "rake db:create" 

* Step 5: Database initialization
# run below command
# "rake db:migrate"

* Step 6: rails s # start the rails server

# To check the merchant page go to this link : http://localhost:3000/merchants
# To check the order page go to this link : http://localhost:3000/orders

* Services (job queues, cache servers, search engines, etc.)
# all jobs are mentioned in jobs folder ,to run the jobs run below command
* Step 7: "rake resque:scheduler"
# Two jobs are there:-
# DailyDisbursementJob : This job will calculate the disbursement amount daily at 8:00 UTC.
# DailyDisbursementCalculationJob : This job will disburse the order based the day of the merchant's live on date.

*Repo link
# git@github.com:priyankayabx/sequra.git



* 


* ...
