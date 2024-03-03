require "csv"

class EmployeeRepository
  def initialize(csv_path)
    @csv_path = csv_path
    @employees = []

    load_csv if File.exist?(csv_path)
  end

  def all
    @employees
  end

  def all_riders
    @employees.select(&:rider?)
  end

  def find(id)
    @employees.find { |e| e.id == id }
  end

  def find_by_username(username)
    @employees.find { |e| e.username == username }
  end

  private

  def load_csv
    CSV.foreach(@csv_path, headers: :first_row, header_converters: :symbol) do |row|
      @employees.push(Employee.new(id: row[:id].to_i, username: row[:username],
                                   password: row[:password], role: row[:role]))
    end
  end
end
