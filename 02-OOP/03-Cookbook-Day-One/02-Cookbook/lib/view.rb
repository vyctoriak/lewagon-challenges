class View
  # #display_list should implement a method to display recipes

  def display_list(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1} - #{recipe.name} - #{recipe.description}"
    end
  end
end
