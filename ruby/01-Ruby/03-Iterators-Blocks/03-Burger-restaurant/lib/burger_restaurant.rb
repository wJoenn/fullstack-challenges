def burger(patty, sauce, topping)
  # TODO: code the `burger` method
  block_given? ? ["bread", yield(patty), sauce, topping, "bread"] : ["bread", patty, sauce, topping, "bread"]
end
