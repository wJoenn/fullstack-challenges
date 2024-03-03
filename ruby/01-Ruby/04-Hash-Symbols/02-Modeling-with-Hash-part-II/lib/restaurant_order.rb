DISHES_CALORIES = {
  "Hamburger" => 250,
  "Cheese Burger" => 300,
  "Veggie Burger" => 540,
  "Vegan Burger" => 350,
  "Sweet Potatoes" => 230,
  "Salad" => 15,
  "Iced Tea" => 70,
  "Lemonade" => 90
}

MEALS = {
  'Cheesy Combo' => ["Cheese Burger", "Sweet Potatoes", "Lemonade"],
  'Veggie Combo' => ["Veggie Burger", "Sweet Potatoes", "Iced Tea"],
  'Vegan Combo' => ["Vegan Burger", "Salad", "Lemonade"]
}

def poor_calories_counter(burger, side, beverage)
  DISHES_CALORIES[burger] + DISHES_CALORIES[side] + DISHES_CALORIES[beverage]
end

def calories_counter(orders)
  # TODO: return number of calories for a less constrained order
  sum = 0
  orders.each do |element|
    if MEALS.key?(element)
      combo = MEALS[element]
      sum += DISHES_CALORIES[combo[0]] + DISHES_CALORIES[combo[1]] + DISHES_CALORIES[combo[2]]
    else
      sum += DISHES_CALORIES[element]
    end
  end
  sum
end
