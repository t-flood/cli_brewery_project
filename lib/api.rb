#handle all of our api requests
class API

  def self.fetch_brewery(city)
    url = "https://api.openbrewerydb.org/breweries?by_city=#{city}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    breweries = JSON.parse(response)
    new_city = City.new(city)
    breweries.each do |b|
      new_brewery = Brewery.new( name: b["name"], id: b["id"], city: city)
      new_city.breweries << new_brewery
    end
  end

  def self.get_brewery_details(brewery)
    url = "https://api.openbrewerydb.org/breweries/#{brewery.id}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    br = JSON.parse(response)
    brewery.type = br["brewery_type"]
    brewery.street = br["street"]
    brewery.state = br["state"]
    brewery.postal_code = br["postal_code"]
    brewery.country = br["country"]
    brewery.phone = br["phone"]
    brewery.website_url = br["website_url"]
  end
end
