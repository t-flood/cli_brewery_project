#keep track of cities
#turn responses into objects
#save all cities created
class Brewery
  attr_accessor :name, :id, :city, :type, :address, :phone, :website
  @@all = []

    def initialize(name:, id:, city:)
      @name = name
      @id = id
      @city = city
      @address = []
      @@all << self
    end

    def self.all
      @@all
    end

    # def self.find_by_city(city)
    #   @@all.select { |b| b.city == city }
    # end
    def self.find(brewery)
      @@all.select{ |b| b == b }
    end

end
