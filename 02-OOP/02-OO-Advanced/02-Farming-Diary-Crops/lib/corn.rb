# TODO: code the Corn class
require_relative "crop"

class Corn < Crop
  attr_reader :state, :grains

  def initialize
    @state = "ripe"
    @grains = 0
  end

  def water!
    if @state == "ripe"
      puts "The corn crop doesn't need water"
      @grains += 10
    end
  end
end
