require_relative 'cookbook'
require_relative 'recipe'
require_relative 'view'
require 'csv'

# The controller will gather data from the cookbook to hand them over to the view. It will also ask the view for information to create new recipes. Here are the methods to implement:

# initialize(cookbook) takes an instance of the Cookbook as an argument.
# list all the recipes
# add a new recipe
# remove an existing recipe

class Controller
  