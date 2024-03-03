require_relative "../views/view"

class OrdersController < Controller
  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository
    @view = View.new
  end

  def add
    elements = order_elements
    order = Order.new(meal: @meal_repository.all[elements[0]], customer: @customer_repository.all[elements[1]],
                      employee: @employee_repository.all_riders[elements[2]])
    @order_repository.create(order)
    @employee_repository.all_riders[elements[2]].orders.push(order)
    @view.confirm_add("Order##{order.id}")
  end

  def list_undelivered_orders
    @view.display_list_orders(@order_repository.undelivered_orders)
  end

  def list_my_orders(employee)
    @view.display_list_orders(employee.orders)
  end

  def mark_as_delivered(employee)
    list_my_orders(employee)
    index = @view.ask_user_num("Index", employee.orders) - 1
    @order_repository.mark!(employee.orders[index])
    @view.confirm_mark("Order##{employee.orders[index].id}")
    employee.orders.delete_at(index)
  end

  def delete
    @view.display_list_orders(@order_repository.all)
    index = @view.ask_user_num("Index", @order_repository.all) - 1
    deleted_item = @order_repository.all[index]
    @order_repository.delete(@order_repository.all[index].id)
    @view.confirm_del("Order##{deleted_item.id}")
  end

  def edit
    @view.display_list_orders(@order_repository.all)
    index = @view.ask_user_num("Index", @order_repository.all) - 1
    elements = order_elements
    @order_repository.edit(@meal_repository.all[elements[0]], @customer_repository.all[elements[1]],
                           @employee_repository.all_riders[elements[2]], index)
    @view.confirm_edit("Order#{@order_repository.all[index].id}")
  end

  private

  def order_elements
    @view.display_list_meals(@meal_repository.all)
    meal_index = @view.ask_user_num("Index", @meal_repository.all) - 1
    @view.display_list_customers(@customer_repository.all)
    customer_index = @view.ask_user_num("Index", @customer_repository.all) - 1
    @view.display_list_riders(@employee_repository.all_riders)
    rider_index = @view.ask_user_num("Index", @employee_repository.all_riders) - 1
    [meal_index, customer_index, rider_index]
  end
end
