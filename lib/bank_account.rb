require "pry"
class BankAccount

    attr_accessor :status, :balance
    attr_reader :name

    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
    end

    def valid?
       if self.status == "open" and self.balance > 0
         true
       else
         false
       end
    end

    def deposit(amount)
        self.balance += amount
    end

    def display_balance
      "Your balance is $#{self.balance}."
    end

    def close_account
      self.status = "closed"
    end

end
