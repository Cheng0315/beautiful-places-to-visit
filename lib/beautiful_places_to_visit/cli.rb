class BeautifulPlacesToVisit::CLI

  def run
    BeautifulPlacesToVisit::Scraper.new.create_destinations_info
    start
  end

  def start
    puts "\nWelcome to the beautiful place where you can view information on beautiful places in the world!\nPlease input 1 to view a list of 10 beautiful places in the US.\nOr input 2 to view a list of 10 beautiful places outside of the US."
    input = gets.chomp.downcase

    if input == '1'
      display_list(input.to_i)
      get_user_second_input(input.to_i)
    elsif input == '2'
      display_list(input.to_i)
      get_user_second_input(input.to_i)
    elsif input == 'exit'
      puts "Thank you for tuning in. See you again soon!"
    else
      start
    end
  end

  def display_list(input)
    if input == 1
      puts "\n************(10 Beautiful Places You Can Visit In The US)************\n\n"
      BeautifulPlacesToVisit::Destination.all.slice(0, 10).each_with_index {|o, i| puts "   #{i+1}. #{o.destination}"}
      puts "\n**********************************************************************\n"
    else
      puts "\n************(10 Beautiful Places You Can Visit Internationally)************\n\n"
      BeautifulPlacesToVisit::Destination.all.slice(10, 20).each_with_index {|o, i| puts "   #{i+1}. #{o.destination}"}
      puts "\n**********************************************************************\n"
    end
  end

  def get_user_second_input(input)
    puts "Which place would you like more information on?\nPlease input the number correspond place.\nOr input 'exit' to exit."
    second_input = gets.chomp.downcase

    if second_input == 'exit'
      puts "Thank you for tuning in. See you again soon!"
    elsif input == 1
      display_destination_info(second_input.to_i - 1)
    elsif input == 2
      display_destination_info(second_input.to_i + 9)
    else
      get_user_second_input(input)
    end
  end

  def display_destination_info(input)
    place = BeautifulPlacesToVisit::Destination.retrieve_info(input)

    puts "***********************(#{place.destination})***********************\n\n"
    puts "      #{place.description}\n\n"
    puts "   Average airfare: #{place.airfare}"
    puts "   Average hotel night: #{place.hotel_cost_per_night}"
    puts "   Cost to spend a week for two: #{place.cost_to_spend_a_week_for_two}"
    puts "   photo: #{place.image_url}\n\n"
    puts "*************************************************************\n"
    puts "Would you like to view information on another beautiful place?\nIf so please input 'y' else input 'n' to exit."

    last_input = gets.chomp.downcase

    loop_around(last_input)
  end

  def loop_around(input)

    if input == 'y'
      start
    elsif input == 'n'
      puts "Thank you for tuning in! See you again soon!"
    else
      loop_around(input)
    end
  end
end
