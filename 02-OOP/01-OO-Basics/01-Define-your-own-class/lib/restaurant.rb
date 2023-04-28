class Restaurant
  def initialize(name, city)
    @open = false
    @name = name
    @city = city
  end

  def open_restaurant?
    return @open
  end

  def start_service
    @open = true
  end

  def stop_service
    @open = false
  end
end
