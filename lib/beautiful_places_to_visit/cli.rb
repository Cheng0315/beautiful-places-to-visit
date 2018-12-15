class BeautifulPlacesToVisit::CLI

  def run
    BeautifulPlacesToVisit::Scraper.new.create_destinations_info
    start
  end

  def start
    puts "\nWelcome to the beautiful place where you can view information on beautiful places you can visit in the world!\nPlease input 1 to view a list of 10 beautiful places you can visit in the US.\nPlease input 2 to view a list of 10 beautiful places you can visit outside the US."
    input = gets.chomp.downcase

    if input == '1'
      display_list(input.to_i)
      get_user_second_input(input.to_i)
    elsif input == '2'
      display_list(input.to_i)
      get_user_second_input(input.to_i)
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
      puts "\n************(10 Beautiful Places You Can Visit Outside The US)************\n\n"
      BeautifulPlacesToVisit::Destination.all.slice(10, 20).each_with_index {|o, i| puts "   #{i+1}. #{o.destination}"}
      puts "\n******************************************************************************\n"
    end
  end

  def get_user_second_input(input)
    puts "Which destination would you like more information on?\nPlease input the number corresponds to the destination.\nOr input 'exit' to exit."
    second_input = gets.chomp.downcase

    if second_input == 'exit'
      puts "\nThank you for checking out information about these beautiful places! We hope you have a great time visiting these places!"
    elsif input == 1 && second_input.to_i.between?(1, 10)
      display_destination_info(second_input.to_i - 1)
    elsif input == 2 && second_input.to_i.between?(1, 10)
      display_destination_info(second_input.to_i + 9)
    else
      display_list(input.to_i)
      puts "You have input invlid character(s)."
      get_user_second_input(input)
    end
  end

  def display_destination_info(input)
    place = BeautifulPlacesToVisit::Destination.retrieve_info(input)

    puts "\n***********************(#{place.destination})***********************\n\n"
    puts "#{place.description}\n\n"
    puts "   Average airfare: #{place.airfare}"
    puts "   Average hotel night: #{place.hotel_cost_per_night}"
    puts "   Cost to spend a week for two: #{place.cost_to_spend_a_week_for_two}"
    puts "   photo: #{place.image_url}\n\n"
    puts "*************************************************************\n"

    loop_around
  end

  def loop_around
    puts "\nWould you like to view information on another beautiful place?\nIf so, please input 'y', else input 'n' to exit.\n"
    input = gets.chomp.downcase

    if input == 'y'
      start
    elsif input == 'n'
      puts "\nThank you for checking out information about these beautiful places! We hope you have a great time visiting these places!"
    else
      loop_around
    end
  end
end
