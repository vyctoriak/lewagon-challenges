require_relative 'animal'

class Chicken < Animal
  attr_reader :eggs, :energy

  def initialize(gender)
    super()
    @eggs = 0
    @gender = gender
    @energy = 0
  end

  def feed!
    super()
    @gender == 'female' ? @eggs += 2 : @eggs += 0
  end

  def talk
    @gender == 'female' ? 'cluck cluck' : 'cock-a-doodle-doo'
  end
end
