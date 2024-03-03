require_relative "repository"

class CustomerRepository < Repository
  def edit(name, instance, index)
    @elements[index].address = instance
    @elements[index].name = name
    update_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_path, headers: :first_row, header_converters: :symbol) do |row|
      @elements.push(Customer.new(id: row[:id].to_i, name: row[:name], address: row[:address]))
    end

    @id = @elements.last.id + 1 unless @elements.empty?
  end

  def update_csv
    CSV.open(@csv_path, "wb") do |csv|
      csv << ["id", "name", "address"]
      @elements.each { |e| csv << [e.id, e.name, e.address] }
    end
  end
end
