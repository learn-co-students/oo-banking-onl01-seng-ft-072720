class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
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
    if @amount > @sender.balance || @sender.status == "closed" || @receiver.status == "closed"
     @status = "rejected"
     "Transaction rejected. Please check your account balance."
  elsif @status != "complete"
    @sender.balance -= @amount
    @receiver.balance += @amount
    @status = "complete"
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
