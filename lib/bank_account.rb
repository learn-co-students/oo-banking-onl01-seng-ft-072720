class BankAccount
  
  attr_accessor :balance, :status
  attr_reader :bank_account, :name
  
  def initialize(name)
  @bank_account = bank_account
  @name = name 
  @balance = 1000
  @status = "open"
  end
  
  def deposit(money)
    @balance += money
  end
  
  def display_balance
    return "Your balance is $#{balance}."
  end
  
  def valid?
    if @status == "open" && @balance > 0 
      true 
    else
      false 
    end
  end
  
  def close_account
    @status = "closed"
  end
  
  def withdrawal(amount)
    self.balance -= amount
  end
end
