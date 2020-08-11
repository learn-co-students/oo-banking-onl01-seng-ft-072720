class Transfer
attr_accessor :sender, :receiver, :status
attr_reader :amount

def initialize(sender, receiver, amount)
@sender = sender
@receiver = receiver
@status = "pending"
@amount = amount
end

def valid?
@sender.valid? && @receiver.valid?
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
  if @status == "complete"
    @receiver.balance -= @amount
    @sender.balance += @amount
  end
  @status = "reversed"
end

end
