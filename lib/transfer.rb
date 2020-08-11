require 'pry'

class Transfer
  # your code here
  attr_accessor :status
  attr_reader :sender, :receiver, :amount
@@all = []
def initialize(sender, receiver, amount)
  @sender = sender
  @receiver = receiver
  @status = "pending"
  @amount = amount
  @@all << self
end

def valid?
  if @receiver.valid? && @sender.valid?
    true
  else
    false
  end
end

def execute_transaction
  if valid?
    # binding.pry
    if @sender.balance > @amount && @status == "pending"
      @sender.balance = @sender.balance - amount
      @receiver.balance = @receiver.balance + amount
      @status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
  end
end

def reverse_transfer
  if self.status == "complete"
    # binding.pry
    @receiver.balance = @receiver.balance - @amount
    @sender.balance = @sender.balance + @amount
    self.status = "reversed"
  end
end














end
