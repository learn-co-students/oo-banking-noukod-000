class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name, @balance, @status = name, 1000, "open"
  end

  def deposit(balance)
    @balance += balance
  end

  def display_balance
    "Your balance is $#{balance}."
  end

  def valid?
    status == "open" and balance > 0
  end

  def close_account
    @status = "closed"
  end
end
