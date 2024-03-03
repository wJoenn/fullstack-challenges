def get_rid_of_surrounding_whitespaces(input : String) : String
  input.strip
end

def belongs_to?(string : String, word : String) : Bool
  string.includes?(word)
end

def replace(string : String, initial_letter : String, new_letter : String) : String
  string.gsub(initial_letter, new_letter)
end

def exactly_divide(first_number : Int, second_number : Int) : Float
  first_number / second_number
end

def divisible_by_two?(number : Int) : Bool
  number.even?
end

def random_subset(array : Array(T), amount : Int) : Array(T) forall T
  array.sample(amount)
end

def randomize(array : Array(T)) : Array(T) forall T
  array.shuffle
end

def ascending_order(array : Array(T)) : Array(T) forall T
  array.sort
end
