require_relative "router"                               # Router

require_relative "app/models/meal"                      # Meal model
require_relative "app/repositories/meal_repository"     # Meal repository
require_relative "app/controllers/meals_controller"     # Meals controller

require_relative "app/models/customer"                  # Customer model
require_relative "app/repositories/customer_repository" # Customer repository
require_relative "app/controllers/customers_controller" # Customer controller

def run
  puts "What to you wanna run ? [customers|meals]"
  loop do
    case gets.chomp
    when "customers" then return CustomersController.new(CustomerRepository.new("data/customers.csv"))
    when "meals" then return MealsController.new(MealRepository.new("data/meals.csv"))
    else puts "I don't understand, try again"
    end
  end
end

Router.new(run).run
