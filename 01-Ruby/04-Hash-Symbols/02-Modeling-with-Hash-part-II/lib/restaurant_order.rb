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

def poor_calories_counter(burger, side, beverage)
  DISHES_CALORIES[burger] + DISHES_CALORIES[side] + DISHES_CALORIES[beverage]
end

MEALS = {
  "Cheesy Combo" => poor_calories_counter("Cheese Burger", "Sweet Potatoes", "Lemonade"),
  "Veggie Combo" => poor_calories_counter("Veggie Burger", "Sweet Potatoes", "Iced Tea"),
  "Vegan Combo" => poor_calories_counter("Vegan Burger", "Salad", "Lemonade")
}

def calories_counter(orders)
  # TODO: return number of calories for a less constrained order
  orders.map { |order| MEALS[order] || DISHES_CALORIES[order] }.reduce(:+)
end
