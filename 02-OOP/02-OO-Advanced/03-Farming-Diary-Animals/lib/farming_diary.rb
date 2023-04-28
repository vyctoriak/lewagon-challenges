# rubocop:disable Lint/LiteralInInterpolation
# DO NOT remove the line below, written for display purpose
require_relative "../spec/helper/board"


puts "\n\n"
puts "📝 Day Three: Animals Talk"
# 1. Read the code and gather some clues to code the classes
cow = Cow.new
female_chicken = Chicken.new('female')
male_chicken = Chicken.new('male')

puts "The cow says #{cow.talk}"
puts "The female chicken says #{female_chicken.talk}"
puts "The male chicken says #{male_chicken.talk}"


puts "\n\n"
puts "📝 Day Four: Feed The Animals"
# 1. Store all your animals in an `animals` array

animals = []

# 2. Call the `feed!` method on each animal (use `each` on the array)

animals.each do |animal|
  animal.feed!
end

# 3. Replace the TODOs
puts "The cow produced #{2} liters of milk"
puts "The female chicken produced #{12} eggs"
puts "The male chicken produced #{0} eggs"


# DO NOT remove the line below, written for display purpose
Board.new.display

# rubocop:enable Lint/LiteralInInterpolation
