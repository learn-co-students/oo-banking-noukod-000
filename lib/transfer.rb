class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  @@transactions = []

  def initialize sender, receiver, amount
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    new_transaction = {sender: @sender, receiver: @receiver, amount: @amount}

    if @@transactions.none? {|transaction| transaction == new_transaction}
      if @sender.balance > @amount
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = 'complete'
        @@transactions << new_transaction
      else
        @status = 'rejected'
        "Transaction rejected. Please check your account balance."
      end
    end
  end

  def reverse_transfer
    @@transactions.last[:sender].balance += @amount
    @@transactions.last[:receiver].balance -= @amount
    @status = 'reversed'
  end
end
