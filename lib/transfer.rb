require 'pry'
class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount
  
  @@last_transation = []
  
  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver 
    @amount = amount
  end
  
def valid?
  a = @sender.valid?
  b = @receiver.valid?
  
  if a && b == true then return true 
else
  return false 
end
end

  def execute_transaction
    a = @sender.balance 
   d = @amount 
   # binding.pry 
    if @status =="complete" then return "This transation cannot happen more than once."
  elsif  a > d && @sender.valid? && @receiver.valid?
   b = @receiver.balance 
   @sender.balance = a - @amount
   @receiver.balance = b + @amount
   @status = "complete"
   @@last_transation = [@sender, @receiver, @amount]
 else
   @status = "rejected"
   return "Transaction rejected. Please check your account balance."
 #binding.pry 
 end
 
 def reverse_transfer
   if status == "complete"
   #  a = @@last_transation[0]
    # b = @@last_transation[1]
    # c = @@last_transation[2]
    # d = a.balance
    # e = b.balance
    # a.balance = d + c 
   #  b.balance - e - c
     @status = "reversed"
  #   binding.pry 
  a = @sender.balance 
    b = @receiver.balance 
   d = @amount 
  @sender.balance = a + @amount
   @receiver.balance = b - @amount
  
  
   else return "rejected"
 end
 
 end
 
 end 
    
  
  
  
end 