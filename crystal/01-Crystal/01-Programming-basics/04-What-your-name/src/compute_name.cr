def compute_name(first_name : String, middle_name : String, last_name : String) : String
  "#{first_name}#{middle_name == "" ? "" : " #{middle_name}"} #{last_name}"
end
