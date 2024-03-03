# Optional
class Transaction
  def initialize(amount)
    # Initialize amount and date of transaction
    @amount = amount
    @time = Time.new
  end

  def to_s
    # Nicely print transaction info using Time#strftime.
    "#{@amount.negative? ? '-' : '+'} #{@amount.abs} euros on #{@time.strftime('%Y/%m/%d at %I:%M%P')}"
  end
end
