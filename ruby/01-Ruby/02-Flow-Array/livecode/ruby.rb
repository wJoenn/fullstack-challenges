def acronym(string)
  string.split.length > 1 ? string.split.map { |e| e[0].upcase }.join(".") : string
end

puts acronym("Salut")
