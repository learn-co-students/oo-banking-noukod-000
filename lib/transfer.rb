class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    
    @status = "pending"
  end
  
  def valid?
    sender.valid? && receiver.valid?
  end
  
  def execute_transaction
    if valid?  && sender.balance > amount && @status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
    else
      reject_tranfer
    end
  end
  
  def reject_tranfer
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
  
  def reverse_transfer
    if valid? && receiver.balance > amount && @status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      @status = "reversed"
    else
      reject_tranfer
    end
  end
end
