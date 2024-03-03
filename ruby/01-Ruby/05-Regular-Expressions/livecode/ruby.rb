def card_match?(number)
  if number.length == number.gsub(" ", "").length
    number.match?(/^([45]\d{15})|3\d{14}$/)
  else
    number.match?(/^([45]\d{3}( \d{4}){3})|(3\d{3} \d{6} \d{5})$/)
  end
end

def luhn?(number)
  sum = 0
  number.gsub(" ", "").chars.map(&:to_i).reverse.each_with_index do |e, i|
    if i.odd?
      e * 2 > 9 ? sum += (e * 2).digits.sum : sum += e * 2
    else
      sum += e
    end
  end
  (sum % 10).zero?
end

def card_provider(number)
  case number[0]
  when "3" then return "American Express"
  when "4" then return "Visa"
  when "5" then return "Master Card"
  end
end

puts "What is your card number ?"
print "> "
number = gets.chomp

if card_match?(number) && luhn?(number)
  puts "Your #{card_provider(number)} number is correct"
elsif card_match?(number)
  puts "Your #{card_provider(number)} number is incorrect"
else
  puts "Your card number is incorrect"
end
