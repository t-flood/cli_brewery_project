#keep track of all cities
#turn responses into objects
#save all cities created
class City
  attr_accessor :name, :breweries
  @@all = []
  def initialize(name)
    @name = name
    @breweries = []
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_city(city)
    @@all.find{ |c| c.name == city }
  end
end
