class BeautifulPlacesToVisit::CLI

  def run
    puts "Welcome to your 'Beautiful Places to Visit' CLI.\nPlease input '1' to view a list of beautiful places to visit in the US.\nPlease input '2' to view a list of beautiful places to visit internationally"
    input = gets.chomp

    if input == "1"
      puts "us"
    elsif input == "2"
      puts "internationally"
    else
      run
    end
  end

end
