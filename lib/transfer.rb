require "pry"

class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  @@all = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def sender
    @sender
  end

  def receiver
    @receiver
  end

  def valid?
    @receiver.valid? && @sender.valid?
  end

  def execute_transaction
    if valid? && !@@all.include?(self) && sender.balance > amount
      sender.balance-=amount
      receiver.balance+=amount
      self.status = "complete"
      @@all << self
    else
      self.status = "rejected"
    end
    self.status != "rejected" ? "Transfer complete." : "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if @@all.include?(self)
      sender.balance+=amount
      receiver.balance-=amount
      self.status = "reversed"
      # @@all.
    end
  end

end
