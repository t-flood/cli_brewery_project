#handle all of our api requests
class API

  def self.fetch_brewery(city)
    url = "https://api.openbrewerydb.org/breweries?by_city=#{city}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    breweries = JSON.parse(response)
    breweries.each do |b|
      Brewery.new( name: b["name"], id: b["id"])
    end
  end

end
