require_relative "repository"

class MealRepository < Repository
  def edit(name, instance, id)
    find(id).price = instance
    find(id).name = name
    update_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_path, headers: :first_row, header_converters: :symbol) do |row|
      @elements.push(Meal.new(id: row[:id].to_i, name: row[:name], price: row[:price].to_i))
    end

    @id = @elements.last.id + 1 unless @elements.empty?
  end

  def update_csv
    CSV.open(@csv_path, "wb") do |csv|
      csv << ["id", "name", "price"]
      @elements.each { |e| csv << [e.id, e.name, e.price] }
    end
  end
end
