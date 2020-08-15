class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid? 
    sender.valid? && receiver.valid? ? true : false
  end
  
  def execute_transaction 
     if valid? && sender.balance > amount && self.status == "pending"
      sender.deposit(@amount * -1)
      receiver.deposit(@amount)
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer 
    if valid? && receiver.balance > amount && self.status == "complete"
      receiver.deposit(@amount * -1)
      sender.deposit(@amount)
      self.status = "reversed"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
end
