class BeautifulPlacesToVisit::CLI

  def run
    BeautifulPlacesToVisit::Scraper.new.create_destinations_info
    start
  end

  def start
    puts "Welcome!\nPlease input '1' to view a list of beautiful places you can visit in the US.\nInput '2' to view a list of beautiful places you can visit around the world."
    input = gets.chomp.to_i

    if input == 1
      display_list(input)
      get_info(input)
    elsif input == 2
      get_info(input)
    else
      start
    end
  end

  def get_info(input)
    puts "Which city or place would you like more information on? Please input the number corresponding to the city or place."

    if input == 1
      BeautifulPlacesToVisit::USDestination.retrieve_info
    else
      BeautifulPlacesToVisit::InternationalDestination.retrieve_info
    end
  end

  def display_list

  end
end
