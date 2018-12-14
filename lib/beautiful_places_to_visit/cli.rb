class BeautifulPlacesToVisit::CLI
  def run
    BeautifulPlacesToVisit::Scraper.new.create_destinations

    puts "Welcome! Please input '1' to view a list of beautiful places you can visit in the US.\nInput '2' to view a list of beautiful places you can visit around the world."
    input = gets.chomp

    if input == "1"

      start
    elsif input == "2"

      start
    else
      run
    end
  end

  def start
    puts "Which city or place would you like more information on? Please input the number corresponding to the city or place."
    input = gets.chomp
  end
end
