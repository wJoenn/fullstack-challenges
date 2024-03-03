require 'open-uri'
require 'json'

def generate_grid(grid_size)
  # TODO: generate random grid of letters
  array = []
  grid_size.times do
    array.push(("A".."Z").to_a.sample)
  end
  array
end

def grid?(grid, attempt)
  dup = grid.dup
  attempt.upcase.chars.each do |e|
    grid.delete_at(grid.find_index(e)) if grid.include?(e)
  end
  dup.length - attempt.length == grid.length
end

def run_game(attempt, grid, start_time, end_time)
  # TODO: runs the game and return detailed hash of result (with `:score`, `:message` and `:time` keys)
  url = "https://wagon-dictionary.herokuapp.com/#{attempt}"
  word = JSON.parse(URI.open(url).read)

  if word["found"] && grid?(grid, attempt)
    { time: end_time - start_time, score: ((attempt.length**2) * 10 / (end_time - start_time)), message: "Well done!" }
  elsif word["found"]
    { time: end_time - start_time, score: 0, message: "Not in the grid" }
  else
    { time: end_time - start_time, score: 0, message: "Not an english word" }
  end
end
