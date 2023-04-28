class View
  def display_list(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. #{recipe.name}: #{recipe.description}"
    end
  end

  def ask_user_for_recipe
    puts "What's the recipe name?"
    name = gets.chomp
    puts "What's the recipe description?"
    description = gets.chomp
    Recipe.new(name, description)
  end

  def ask_user_for_index
    puts "Enter recipe number to delete:"
    gets.chomp.to_i - 1
  end
end
