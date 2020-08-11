class Transfer
  attr_accessor :sender, :receiver, :amount, :status, :reverse_amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
    @reverse_amount = amount
  end

  def valid? 
   if sender.valid? == true && receiver.valid? == true 
     true 
   else 
     false 
   end
  end
  
  def execute_transaction
    if valid? == true 
      @sender.balance = sender.balance - amount
      @receiver.balance = receiver.balance + amount
      @amount = 0
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer 
   if @sender.balance < 1000
    @receiver.balance = receiver.balance - @reverse_amount
    @sender.balance = sender.balance + @reverse_amount
    @status = "reversed"
  end
end

end
