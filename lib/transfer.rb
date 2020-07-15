class Transfer
  attr_accessor :sender, :receiver, :amount, :status

   def initialize(sender, receiver, amount)
     @sender, @receiver, @amount, @status = sender, receiver, amount, "pending"
   end

   def valid?
     sender.valid? and receiver.valid?
   end

   def execute_transaction
     if valid? and status == "pending" and sender.balance >= amount
       receiver.balance += amount
       sender.balance -= amount
       @status = "complete"
     else
       @status = "rejected"
       "Transaction rejected. Please check your account balance."
     end
   end

   def reverse_transfer
     if status == "complete"
       sender.balance += amount
       receiver.balance -= amount
       self.status = "reversed"
     end
   end
end
