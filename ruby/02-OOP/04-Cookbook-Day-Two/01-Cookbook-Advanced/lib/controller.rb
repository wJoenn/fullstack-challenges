require "open-uri"
require "nokogiri"

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    @view.display_list(@cookbook.all, true) unless @view.empty?(@cookbook.all.length)
  end

  def create
    name = @view.ask_name
    description = @view.ask_desc
    rating = @view.ask_rating
    time = @view.ask_time
    @cookbook.add_recipe(Recipe.new({ name: name, description: description, rating: rating,
                                      time: time, mark: "false" }))
    @view.confirm_add(name)
  end

  def destroy
    unless @view.empty?(@cookbook.all.length)
      @view.display_list(@cookbook.all)
      index = 0
      index = @view.ask_index(@cookbook.all) if @cookbook.all.length > 1
      deleted_item = @cookbook.all[index]
      @cookbook.remove_recipe(index)
      @view.display_list(@cookbook.all)
      @view.confirm_del(deleted_item)
    end
  end

  def fetch
    ingredient = @view.ask_ingr
    data = browse(ingredient)
    recipes = data[0]
    index = data[1]

    @view.confirm_import(recipes[index])
    @cookbook.add_recipe(recipes[index])
    @view.confirm_add(recipes[index].name)
  end

  def mark
    unless @view.empty?(@cookbook.all.length)
      index = 0
      if @cookbook.all.length > 1
        @view.display_list(@cookbook.all)
        index = @view.ask_index(@cookbook.all)
      end
      @cookbook.mark!(index)
      @view.display_list(@cookbook.all)
      @view.confirm_mark(@cookbook.all[index])
    end
  end

  private

  def browse(ingredient)
    service = ScrapeService.new(ingredient)
    loop do
      recipes = service.fetch_data
      @view.display_list_fetch(recipes, service.index)
      index = @view.ask_index(recipes)
      return [recipes, index] unless ["next", "previous"].include?(index)

      index == "next" ? service.index += 1 : service.index -= 1
    end
  end
end
