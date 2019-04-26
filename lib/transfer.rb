class Transfer
  # your code here
  attr_accessor :sender,:receiver,:amount,:status
  @list_transfer = []
  def initialize(sender,receiver,amount,status= "pending")
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = status
  end 
  
  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end 
  
  def execute_transaction
    if @sender.balance > @amount && @status == "pending"
          @sender.balance -= @amount
          @receiver.balance += @amount
          self.status = "complete"
    else 
            self.status = "rejected"
          "Transaction rejected. Please check your account balance."
    end
  end 
  
  def reverse_transfer
    if self.status == "complete"
       @sender.balance += @amount
       @receiver.balance -= @amount
       self.status = "reversed"
    end 
  end 
end
