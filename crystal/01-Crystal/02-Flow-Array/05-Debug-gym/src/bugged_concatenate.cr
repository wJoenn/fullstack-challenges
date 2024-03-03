def bugged_concatenate(array : Array(Int32 | String)) : String
  array.reduce("") { |acc, value| "#{acc}#{value}" }.upcase
end

def build_1984_title : String
  bugged_concatenate([1, "9", 84, " ", "George Orwell"])
end
