class BankAccount
  attr_accessor :balance, :status #create a setter and getter for each
  attr_reader :name               # create a getter for name

  def initialize(the_account_name)
    @name = the_account_name # initialize name to the_account_name
    @balance = 1000          # initialize balance to 1000
    @status = "open"         # initialize status to "open"
  end

  def deposit(deposit_money)
    @balance += deposit_money # depositing money on top of your balance
  end

  def display_balance
    "Your balance is $#{@balance}." #display balance the total balance
  end

  def valid? # set the validity of status to true or false
    @status == "open" && @balance > 0 ? true : false
  end

  def close_account
    @status = "closed" #close status
  end
end
