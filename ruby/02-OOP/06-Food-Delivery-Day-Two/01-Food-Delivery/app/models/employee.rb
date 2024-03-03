class Employee
  attr_accessor :id, :orders
  attr_reader :username, :password, :role

  def initialize(args = {})
    @id = args[:id]
    @username = args[:username]
    @password = args[:password]
    @role = args[:role]
    @orders = []
  end

  def manager?
    @role == "manager"
  end

  def rider?
    @role == "rider"
  end

  def add_order(order)
    @orders.push(order) unless order.delivered?
    order.employee = self
  end
end
