require_relative "router"                               # Router

require_relative "app/models/meal"                      # Meal model
require_relative "app/repositories/meal_repository"     # Meal repository
require_relative "app/controllers/meals_controller"     # Meals controller

require_relative "app/models/customer"                  # Customer model
require_relative "app/repositories/customer_repository" # Customer repository
require_relative "app/controllers/customers_controller" # Customers controller

require_relative "app/models/employee"                  # Employee model
require_relative "app/repositories/employee_repository" # Employee repository

require_relative "app/models/order"                     # Order model
require_relative "app/repositories/order_repository"    # Order repository
require_relative "app/controllers/orders_controller"    # Order controller

empl_repo = EmployeeRepository.new("data/employees.csv")

cust_repo = CustomerRepository.new("data/customers.csv")
custs_con = CustomersController.new(cust_repo)

meal_repo = MealRepository.new("data/meals.csv")
meals_con = MealsController.new(meal_repo)

order_repo = OrderRepository.new("data/orders.csv", meal_repo, cust_repo, empl_repo)
orders_con = OrdersController.new(meal_repo, cust_repo, empl_repo, order_repo)

puts "Enter username"
employee = nil
while employee.nil?
  print "> "
  employee = empl_repo.find_by_username(gets.chomp)

  puts "username not found" if employee.nil?
end

puts "\nEnter password"
loop do
  print "> "
  break if employee.password == gets.chomp

  puts "wrong password"
end

Router.new(custs_con, meals_con, orders_con, employee).run
