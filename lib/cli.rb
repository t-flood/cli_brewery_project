#interactions with the user
#contain all of our gets and puts
#control the flow of our program
class CLI

  def start
    puts ""
    puts "Welcome to Brewery Finder"
    puts ""
    puts "Search for a brewery by entering a city"
    puts ""
    @city = gets.strip.downcase
    API.fetch_brewery(@city)
    puts ""
    brewery = Brewery.all
    print_breweries(brewery)
    puts ""
    puts "Type a number listed to see more details or type 'exit' to exit"
  end

  def print_breweries(br)
    puts ""
    puts "Here are the breweries in #{@city}:"
    puts ""
    br.each.with_index(1) do | b, i |
    puts "#{i}. #{b.name}"
    end
  end

end
