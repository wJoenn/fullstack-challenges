class Order
  attr_accessor :id, :meal, :employee, :customer
  attr_writer :delivered

  def initialize(args = {})
    @id = args[:id]
    @meal = args[:meal]
    @customer = args[:customer]
    @employee = args[:employee]
    @delivered = args[:delivered] == true
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end
end
