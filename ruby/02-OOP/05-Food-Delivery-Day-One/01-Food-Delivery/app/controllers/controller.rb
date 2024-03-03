require_relative "../views/view"

class Controller
  def initialize(repository)
    @repository = repository
    @view = View.new
  end

  def delete
    list
    id = @view.ask_user_num("ID", @repository.all)
    deleted_item = @repository.all.select { |e| e.id == id }[0]
    @repository.delete(id)
    @view.confirm_del(deleted_item.name)
  end

  def edit
    list
    id = @view.ask_user_num("ID", @repository.all)
    name = @view.ask_user_str("Name")
    instance = yield
    @repository.edit(name, instance, id)
    @view.confirm_edit(name)
  end
end
