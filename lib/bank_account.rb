class BankAccount

attr_accessor :balance, :status 
attr_reader :name 

def initialize(name)
  @name = name 
  @balance = 1000
  @status = "open"
end

def deposit(amount)

a = @balance
b = amount 
@balance = a + b 
end

def display_balance
  return "Your balance is $#{@balance}."
end 

def valid?
  a = @status
  b = @balance
if a == "open" && b > 0 then true 
else false 
end
end

def close_account
  @status = "closed"
end 

end