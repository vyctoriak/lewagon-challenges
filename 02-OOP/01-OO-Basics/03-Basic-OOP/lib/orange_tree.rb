class OrangeTree
  # TODO: Implement all the specs defined in the README.md :)

  attr_accessor :age, :height, :fruits

  def initialize
    @age = 0
    @height = 0
    @fruits = 0
    @dead = false
    @probability_to_die = 0
  end

  def one_year_passes!
    @age += 1

    grow unless @dead
  end

  def dead?
    @dead
  end

  def pick_a_fruit!
    @fruits -= 1 unless @fruits.zero?
  end

  private

  def grow
    @height += 1 if @age <= 10

    if @age > 50
      may_die!
      @probability_to_die += 1
    elsif @age > 100
      @dead = true
    else
      produce_fruits!
    end
  end

  def produce_fruits!
    # @fruits = 100 if @age > 5 && @age < 10
    # @fruits = 200 if @age >= 10 && @age < 15
    # @fruits = 0 if @age >= 15
    if @age > 5 && @age < 10
      @fruits = 100
    elsif @age >= 10 && @age < 15
      @fruits = 200
    else
      @fruits = 0
    end
  end

  def may_die!
    @dead = (@age > 50 && age <= 100 && ((rand(50) * @probability_to_die) > @probability_to_die))
  end
end
