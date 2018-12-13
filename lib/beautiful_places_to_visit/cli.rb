class BeautifulPlacesToVisit::CLI

  def run
    puts "Welcome to your 'Beautiful Places to Visit' CLI.\nPlease input '1' to view a list of beautiful places to visit in the US.\nPlease input '2' to view a list of beautiful places to visit internationally"
    #input = gets.chomp
    doc = Nokogiri::HTML(open("http://time.com/money/page/best-places-to-travel-2018/"))
    destination = doc.css("section.chapter h2").collect do |info|
      info
    end
    avg_airfare = doc.css("section.chapter h2 + p a:nth-of-type(1)").collect do |info|
      info.text
    end
    binding.pry
    if input == "1"
      puts "us"
    elsif input == "2"
      puts "internationally"
    else
      run
    end
  end

end
