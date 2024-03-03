require_relative "../views/view"

class Controller
  def initialize(repository)
    @repository = repository
    @view = View.new
  end

  def delete
    list
    index = @view.ask_user_num("Index", @repository.all) - 1
    deleted_item = @repository.all[index]
    @repository.delete(@repository.all[index].id)
    @view.confirm_del(deleted_item.name)
  end

  def edit
    list
    index = @view.ask_user_num("Index", @repository.all) - 1
    name = @view.ask_user_str("Name")
    instance = yield
    @repository.edit(name, instance, index)
    @view.confirm_edit(name)
  end
end
