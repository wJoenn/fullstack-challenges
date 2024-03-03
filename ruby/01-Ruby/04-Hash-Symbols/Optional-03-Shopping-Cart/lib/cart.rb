# This file contains methods related to your shopping cart.
# You should complete it according to the instructions in the TODO comments

def add_to_cart(cart, product)
  # TODO: you get a cart and a product. Add the product to the cart!
  cart.push(product)
end

def cart_to_s(cart)
  # TODO: you get a cart, return a coma-separated String list of the contained products
  hash = {}
  array = []
  cart.each { |e| hash.key?(e) ? hash[e] += 1 : hash[e] = 1 }
  hash.each { |k, v| v > 1 ? array.push("#{k} x #{v}") : array.push(k) }
  array.join(", ")
end

def cart_total_price(cart, store_items)
  # TODO: you get a cart and the store items with their prices. Return the total
  # price of the shopping cart.
  # /!\ Make sure it does not crash with carts having items not in store!
  sum = 0
  cart.each { |e| sum += store_items[e] if store_items[e] }
  sum
end
