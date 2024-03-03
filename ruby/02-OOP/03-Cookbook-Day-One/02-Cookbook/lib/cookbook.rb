require "csv"

class Cookbook
  def initialize(csv_file_path = nil)
    @csv_file_path = csv_file_path
    @recipes = []
    unless @csv_file_path.nil?
      CSV.foreach(@csv_file_path) { |e| @recipes.push(Recipe.new({ name: e[0], description: e[1] })) }
    end
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes.push(recipe)
    CSV.open(@csv_file_path, "a") { |csv| csv << [recipe.name, recipe.description] } unless @csv_file_path.nil?
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    unless @csv_file_path.nil?
      CSV.open(@csv_file_path, "wb") { |csv| @recipes.each { |e| csv << [e.name, e.description] } }
    end
  end
end
