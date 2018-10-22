class AccessError < KeyError; end
class BankAccount
  attr_accessor :balance, :status
  attr_reader :name
  def initialize(name="")
    @name = name
    @balance = 1000
    @status = "open"
  end

  def name=(name="")
    raise AccessError, "You can't change the name of the Bank Account"
  end

  def deposit(money=0)
    @balance += money
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    @status == "open" && @balance > 0
  end

  def close_account
    @status = "closed"
    @balance = 0
  end

end
