#keep track of all breweries
#turn responses into objects
#save all breweries created
class Brewery
  attr_accessor :name, :id, :city, :type, :street, :state, :postal_code, :country, :phone, :website_url
  @@all = []

    def initialize(name:, id:, city:)
      @name = name
      @id = id
      @city = city
      @@all << self
    end

    def self.all
      @@all
    end
end
