class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount, status="pending")
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = status
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if  valid? && @sender.balance > @amount && self.status == "pending"

      @sender.deposit( @amount * -1 )
      @receiver.deposit( @amount )
      @status = "complete"

    # elsif @status == "complete"
      # puts "Transaction was already excuted"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.deposit( @amount )
      @receiver.deposit( @amount * -1)
      @status = "reversed"
    end
  end

end
