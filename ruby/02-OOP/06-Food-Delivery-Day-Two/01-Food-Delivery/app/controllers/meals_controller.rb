require_relative "controller"

class MealsController < Controller
  def add
    name = @view.ask_user_str("Name")
    price = @view.ask_user_num("Price")
    @repository.create(Meal.new(name: name, price: price))
    @view.confirm_add(name)
  end

  def list
    @view.display_list_meals(@repository.all)
  end

  def edit
    super { @view.ask_user_num("Price") }
  end
end
