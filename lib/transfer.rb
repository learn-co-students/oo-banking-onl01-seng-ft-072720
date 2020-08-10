class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    
    if self.sender.status != "open" || self.receiver.status != "open" || self.sender.balance < self.amount
      self.status = "rejected"
      "Transaction rejected. Please check your account balance." 
    elsif self.status != "complete"
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete" 
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.receiver.balance -= self.amount
      self.sender.balance += self.amount
      self.status = "reversed"
    end
  end
end
