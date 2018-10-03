class Transfer
  attr_accessor :sender, :receiver, :amount, :status, :transfered

   def initialize(sender, receiver, amount)
     @sender, @receiver, @amount, @status, @transfered = sender, receiver, amount, "pending", true
   end

   def valid?
     sender.valid? and receiver.valid?
   end

   def execute_transaction
     if valid? and transfered and sender.balance >= amount
       receiver.balance += amount
       sender.balance -= amount
       @status, @transfered = "complete", false
     else
       @status = "rejected"
       "Transaction rejected. Please check your account balance."
     end
   end

   def reverse_transfer
     if !transfered
       sender.balance += amount
       receiver.balance -= amount
       @status, @transfered = "reversed", true
     end
   end
end
