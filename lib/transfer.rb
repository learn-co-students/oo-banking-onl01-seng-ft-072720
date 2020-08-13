require 'pry'

class Transfer
  
  attr_reader :transfer #initializes the transfer
  attr_accessor :sender, :receiver, :status, :amount # init sender, rcvr, status, and amt
  
  def initialize(sender, receiver, amount) # arguments for init
    @transfer = transfer 
    @sender = sender
    @receiver = receiver
    @status = "pending" 
    @amount = amount
  end
  
  def valid?
    sender.valid? && receiver.valid? # sender and rcvr valid? true or false
  end
  
  def execute_transaction
     if @amount > sender.balance || @status == "complete" || valid? == false # checks conditions 
      @status = "rejected" # if any of the conditions are not met, will reject transfer 
      "Transaction rejected. Please check your account balance." # displays message
    else
      sender.balance -= @amount # subtracts from sender amount
      receiver.balance += @amount # adds to rcvr amount
      @status = "complete" 
    end
  end
  
  def reverse_transfer
    if @status == "complete" # if status is complete, transfer qualifies to be reversed
      sender.balance += @amount #adds amount back to sender's balance 
      receiver.balance -= @amount #subtracts amount from rcvr's balance
      @status = "reversed" #updates the status of the transfer
  end
end
  
end
