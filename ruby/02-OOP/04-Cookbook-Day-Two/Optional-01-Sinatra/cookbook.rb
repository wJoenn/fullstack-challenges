require "csv"

class Cookbook
  def initialize(csv_file_path = nil)
    @csv_file_path = csv_file_path
    @recipes = []
    unless @csv_file_path.nil?
      CSV.foreach(@csv_file_path) do |e|
        @recipes.push(Recipe.new({ name: e[0], description: e[1], rating: e[2], time: e[3], mark: e[4] }))
      end
    end
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes.push(recipe)
    unless @csv_file_path.nil?
      CSV.open(@csv_file_path, "a") do |csv|
        csv << [recipe.name, recipe.description, recipe.rating, recipe.time, recipe.mark]
      end
    end
  end

  def mark!(index)
    @recipes[index].mark = @recipes[index].mark == false
    update_csv unless @csv_file_path.nil?
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    update_csv unless @csv_file_path.nil?
  end

  private

  def update_csv
    CSV.open(@csv_file_path, "wb") do |csv|
      @recipes.each { |e| csv << [e.name, e.description, e.rating, e.time, e.mark] }
    end
  end
end
