require 'pry'

class BankAccount 
  
  attr_reader :account, :name # initializes with account and name as read-only 
  attr_accessor :balance, :status # initializes with balance and status 

  def initialize(name) #initializes with name as arg
    @account = account # initializes with account
    @name = name 
    @balance = 1000 # balance initializes with $1000
    @status = "open" # status of account
  end
  
  def deposit(deposit)
    @balance = @balance + deposit # will add deposit amount to @balance 
  end
  
  def display_balance
    ("Your balance is $#{@balance}.") # will display balance with message
  end
  
  def valid? 
    @status == "open" && @balance > 0 ? true : false #if both conditions are met, will be true
  end
  
  def close_account
    @status = "closed" # uses status to close the account 
  end

end
