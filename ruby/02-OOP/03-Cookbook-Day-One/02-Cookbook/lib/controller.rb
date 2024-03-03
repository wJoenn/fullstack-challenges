class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    @view.display_list(@cookbook.all, true)
  end

  def create
    name = @view.ask_name
    description = @view.ask_desc
    @cookbook.add_recipe(Recipe.new({ name: name, description: description }))
    @view.add_message(name)
  end

  def destroy
    @view.display_list(@cookbook.all)
    index = 0
    index = @view.ask_index((@cookbook.all)) if @cookbook.all.length > 1
    @view.del_message(@cookbook.all[index])
    @cookbook.remove_recipe(index)
  end
end
