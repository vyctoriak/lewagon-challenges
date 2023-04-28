# Optional
class Transaction
  def initialize(amount)
    # Initialize amount and date of transaction
    @amount = amount
    @date_of_transaction = Time.now
  end

  def to_s
    # Nicely print transaction info using Time#strftime.
    print "#{@date_of_transaction.strftime('%d/%m/%Y')} | #{@amount}"
  end
end
