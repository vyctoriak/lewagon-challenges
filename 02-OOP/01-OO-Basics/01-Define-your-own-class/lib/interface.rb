require_relative "restaurant"

dominos = Restaurant.new("Domino's", "London")
mcdonalds = Restaurant.new("McDonald's", "Munich")

dominos.start_service!
mcdonalds.start_service!
