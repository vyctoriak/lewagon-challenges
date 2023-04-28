# We now need a structure to store our user’s recipes. We don’t have a proper database yet, so we will use a class that acts like one (as we saw in the lecture). When a Ruby program exits, we lose all the data that we stored in variables. If we want to retrieve the data next time we run the program, we need to persist them, on the hard drive. We’ll use a CSV file for that! The file is empty at this time of the challenge, you’ll add your own recipes later through the app.
# Cookbook without CSV #initialize should create an array `@recipes`
# In the context of this challenge, the repository stores the recipes added by the user. In other words, it is the cookbook. Let’s name the class Cookbook to write explicit and meaningful code, but keep in mind that it’s the repository from the lecture’s diagram!
# Implement the Cookbook class with 4 methods:

# initialize(csv_file_path) which loads existing Recipe from the CSV
# all which returns all the recipes
# create(recipe) which creates a recipe and adds it to the cookbook
# destroy(recipe_index) which removes a recipe from the cookbook.


require 'csv'
require_relative 'recipe'

class Cookbook
  def initialize(csv_file_path)
    @recipes = []
    @csv_file_path = csv_file_path
    load_csv
  end

  def all
    @recipes
  end

  def create(recipe)
    @recipes << recipe
    save_csv
  end

  def destroy(recipe_index)
    @recipes.delete_at(recipe_index)
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path) do |row|
      @recipes << Recipe.new(row[0], row[1], row[2], row[3])
    end
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.prep_time, recipe.difficulty]
      end
    end
  end
end
