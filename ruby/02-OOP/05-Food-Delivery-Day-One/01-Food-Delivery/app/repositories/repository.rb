require "csv"

class Repository
  def initialize(csv_path)
    @csv_path = csv_path
    @elements = []
    @id = 1

    load_csv if File.exist?(@csv_path)
  end

  def all
    @elements
  end

  def create(instance)
    instance.id = @id
    @id += 1
    @elements.push(instance)
    update_csv
  end

  def find(id)
    @elements.find { |e| e.id == id }
  end

  def delete(id)
    @elements.reject! { |e| e.id == id }
    update_csv
  end
end
