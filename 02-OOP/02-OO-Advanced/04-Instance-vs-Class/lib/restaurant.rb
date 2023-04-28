class Restaurant
  attr_reader :city, :name, :rating

  def initialize(city, name)
    @city = city
    @name = name
    @rating = []
  end

  def self.filter_by_city(restaurants, city)
    restaurants.select { |restaurant| restaurant.city == city }
  end

  def average_rating
    @rating = @rating.reduce(:+) / @rating.size
  end

  def rate(rating)
    @rating << rating
  end
end
