require "csv"

class OrderRepository
  def initialize(csv_path, meal_repo, cust_repo, empl_repo)
    @csv_path = csv_path
    @elements = []
    @id = 1

    @meal_repository = meal_repo
    @customer_repository = cust_repo
    @employee_repository = empl_repo

    load_csv if File.exist?(csv_path)
  end

  def all
    @elements
  end

  def undelivered_orders
    @elements.reject(&:delivered?)
  end

  def create(instance)
    instance.id = @id
    @id += 1
    @elements.push(instance)
    update_csv
  end

  def mark!(order)
    order.deliver!
    update_csv
  end

  def delete(id)
    @elements.reject! { |e| e.id == id }
    update_csv
  end

  def edit(meal, customer, employee, index)
    @elements[index].meal = meal
    @elements[index].customer = customer
    @elements[index].employee = employee
    update_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_path, headers: :first_row, header_converters: :symbol) do |row|
      order = Order.new(id: row[:id].to_i)
      order.delivered = row[:delivered] == "true"
      @employee_repository.all.each { |e| e.add_order(order) if e.id == row[:employee_id].to_i }
      order.meal = @meal_repository.find(row[:meal_id].to_i)
      order.customer = @customer_repository.find(row[:customer_id].to_i)
      @elements.push(order)
    end

    @id = @elements.last.id + 1 unless @elements.empty?
  end

  def update_csv
    CSV.open(@csv_path, "wb") do |csv|
      csv << ["id", "delivered", "meal_id", "customer_id", "employee_id"]
      @elements.each { |e| csv << [e.id, e.delivered?, e.meal.id, e.customer.id, e.employee.id] }
    end
  end
end
