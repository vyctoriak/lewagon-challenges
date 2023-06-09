class VendingMachine
  # TODO: add relevant getter/setter to this class to make the scenarios work properly.

  def initialize(snack_price_cents, snack_count)
    @user_balance_cents = 0
    @snack_count = snack_count
    @snack_price_cents = snack_price_cents
  end

  attr_accessor :user_balance_cents, :snack_count, :snack_price_cents

  def insert_coin(input_cents)
    # TODO: what happens to @snack_count, @user_balance_cents and @snack_price_cents
    # when the user inserts a coin?
    @user_balance_cents = @user_balance_cents + input_cents
  end

  def buy_snack
    # TODO: what happens to @snack_count, @user_balance_cents and @snack_price_cents
    # when the user pushes a button to buy a Snack?
    if @user_balance_cents >= @snack_price_cents && @snack_count.positive?
      @user_balance_cents = @user_balance_cents - @snack_price_cents
      @snack_count = @snack_count - 1
    else
      puts "Not enough money"
    end
  end

  def refill(new_snack_count)
    @snack_count += new_snack_count
  end
end
