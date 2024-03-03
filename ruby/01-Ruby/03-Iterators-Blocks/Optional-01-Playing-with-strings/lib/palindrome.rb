def palindrome?(a_string)
  # TODO: check if a_string is a palindrome
  a_string == "" ? false : a_string.downcase.gsub(/[^a-zA-Z]/, "").reverse == a_string.downcase.gsub(/[^a-zA-Z]/, "")
end
