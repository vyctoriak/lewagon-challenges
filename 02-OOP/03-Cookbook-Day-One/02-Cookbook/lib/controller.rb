require_relative 'view'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    display_recipes
  end

  def add
    recipe = @view.ask_user_for_recipe
    @cookbook.create(recipe)
  end

  def remove
    display_recipes
    index = @view.ask_user_for_index
    @cookbook.destroy(index)
  end

  private

  def display_recipes
    recipes = @cookbook.all
    @view.display_list(recipes)
  end
end
