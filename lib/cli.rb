#interactions with the user
#contain all of our gets and puts
#control the flow of our program
class CLI

  def start
    puts ""
    puts "Welcome to Brewery Finder"
    puts ""
    prompt_city
    prompt
    inp = gets.strip.downcase
    while inp != 'done' do
      if inp == 'list'
        print_breweries(City.find_by_city(@city).breweries)
      elsif inp.to_i > 0 && inp.to_i <= City.find_by_city(@city).breweries.length
        brewery = City.find_by_city(@city).breweries[inp.to_i - 1]
          API.get_brewery_details(brewery)
          print_brewery(brewery)
      elsif inp == 'return'
        prompt_city
      else
        puts ""
        puts "Try again"
        puts ""
      end
      prompt
      inp = gets.strip.downcase
    end
    puts ""
    puts "See ya!"
  end

  def print_breweries(br)
    puts ""
    puts "Here are the breweries in #{@city.capitalize}:"
    br.each.with_index(1) do | b, i |
    puts "#{i}. #{b.name}"
    end
    puts ""
  end

  def print_brewery(brewery)
    puts ""
    puts "#{brewery.name}"
    puts "#{brewery.type} brewery"
    puts "#{brewery.street}"
    puts "#{brewery.city.capitalize}"
    puts "#{brewery.state}"
    puts "#{brewery.postal_code}"
    puts "#{brewery.country}"
    puts "#{brewery.phone}"
    puts "#{brewery.website_url}"
    puts ""
  end

  def prompt
    puts "Type in a number listed to see details"
    puts "or type 'return' to input another city"
    puts "or type 'list' to view the brewery list"
    puts "or type 'done' when you're done"
    puts ""
  end

  def prompt_city
    puts ""
    puts "Search for a brewery by entering a city"
    puts ""
    @city = gets.strip.downcase
    API.fetch_brewery(@city)
    breweries = City.find_by_city(@city).breweries
    print_breweries(breweries)
  end
end
