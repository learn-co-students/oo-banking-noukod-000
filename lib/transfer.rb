class Transfer
  # your code here
  
  attr_accessor :sender,:receiver,:amount,:status

  def initialize(sender,receiver,amount)
    @sender=sender
    @receiver=receiver
    @status="pending"
    @amount=amount
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if !@sender.valid? || @sender.balance < @amount
      @status="rejected"
      return "Transaction rejected. Please check your account balance."
    end

    if(@status!="complete")
      @sender.balance-=@amount
      @receiver.balance+=@amount
      @status="complete"
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance+=@amount
      @receiver.balance-=@amount
      @status="reversed"
    end
  end

  
end
