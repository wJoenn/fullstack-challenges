require_relative "controller"

class CustomersController < Controller
  def add
    name = @view.ask_user_str("Name")
    address = @view.ask_user_str("Address")
    @repository.create(Customer.new(name: name, address: address))
    @view.confirm_add(name)
  end

  def list
    @view.display_list_customers(@repository.all)
  end

  def edit
    super { @view.ask_user_str("Address") }
  end
end
