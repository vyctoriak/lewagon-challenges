# TODO: code the Rice class

class Rice < Crop
  attr_reader :state, :grains

  def initialize
    @state = "ripe"
    @grains = 0
  end

  def water!
    if @state == "ripe"
      puts "The rice crop doesn't need water"
      @grains += 5
    end
  end

  def transplant!
    @grains += 10
  end
end
