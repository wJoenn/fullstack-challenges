require 'csv'

def most_successful(number, max_year, file_path)
  # TODO: return the `number` of most successful movies before `max_year`
  array = []
  CSV.foreach(file_path) do |e|
    array.push(e) if e[1].to_i < max_year
  end
  array.sort_by { |e| -e[2].to_i }.first(number).map { |e| { name: e[0], year: e[1].to_i, earnings: e[2].to_i } }
end
