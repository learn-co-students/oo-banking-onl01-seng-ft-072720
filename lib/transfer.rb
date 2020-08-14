require "pry"
class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
     if sender.valid? == true and receiver.valid? == true
       true
     else
       false
     end
  end

  def execute_transaction
     if @sender.balance > @amount and valid? and @status == "pending"
        #binding.pry
       @receiver.deposit(@amount)
       @sender.balance -= @amount
       return @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
     end
  end

  def reverse_transfer
     if @status = "complete"
        self.execute_transaction.reverse
        #binding.pry
     end
  end
end
