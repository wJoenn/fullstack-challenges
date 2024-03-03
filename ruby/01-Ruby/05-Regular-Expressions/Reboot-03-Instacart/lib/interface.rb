# TODO: you can build your instacart program here!

STORE = {
  "kiwi" => [1.25, 5],
  "banana" => [0.5, 4],
  "mango" => [4, 1],
  "asperagus" => [9, 5]
}

def store_items
  array = []
  STORE.each { |k, v| array.push("#{k}: #{v[0]}€ (#{v[1]} available)") }
  array.join("\n")
end

def available?(input)
  STORE.keys.include?(input)
end

def quantity?(input, quantity)
  quantity <= STORE[input][1]
end

def item_price(item)
  if item[:quantity] > 1
    "#{item[:item]}: #{item[:quantity]} x #{STORE[item[:item]][0]}€ = #{item[:quantity] * STORE[item[:item]][0]}€\n"
  else
    "#{item[:item]}: #{STORE[item[:item]][0]}€\n"
  end
end

def total(cart)
  sum = 0
  cart.each { |e| sum += STORE[e[:item]][0] * e[:quantity] }
  sum
end

puts "-------------------\nWelcome to Instacart\n--------------------"
puts "In our store today:\n#{store_items}\n--------------------"

input = nil
cart = []

loop do
  puts "Which item? (or \"quit\" to checkout)"
  print ">"
  input = gets.chomp
  break if input == "quit"

  if available?(input)
    puts "How many?"
    print ">"
    quantity = gets.chomp.to_i

    until quantity?(input, quantity) && quantity.positive?
      if quantity.positive?
        puts "Sorry, there are only #{STORE[input][1]} #{input} left."
      else
        puts "This is not a number"
      end
      print ">"
      quantity = gets.chomp.to_i
    end

    STORE[input][1] -= quantity
    cart.push({ item: input, quantity: quantity })
  else
    puts("Sorry we don't have #{input} today")
  end
end

puts "--------BILL--------"
cart.each { |e| puts item_price(e) }
puts "Total: #{total(cart)}€\n--------------------"
