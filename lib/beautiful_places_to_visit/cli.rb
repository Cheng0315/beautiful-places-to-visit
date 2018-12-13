class BeautifulPlacesToVisit::CLI

  def run
    puts "Welcome to your 'Beautiful Places to Visit' CLI.\nPlease input '1' to view a list of beautiful places to visit in the US.\nPlease input '2' to view a list of beautiful places to visit internationally"
    #input = gets.chomp
    doc = Nokogiri::HTML(open("http://time.com/money/page/best-places-to-travel-2018/"))
    arr = []
    airfare_arr = doc.css("section.chapter h2 + p a:nth-of-type(1)").collect {|a| a.text}
    missing_hotel_price = airfare_arr.slice!(2)
    hotel_price_arr = doc.css("section.chapter h2 + p a:nth-of-type(2)").collect {|a| a.text}
    hotel_price_arr.insert(2, missing_hotel_price)

    doc.css("section.chapter h2").each.with_index(0) do |info, idx|
      hash = {}
      hash[:destination] = info.text.chomp
      hash[:airfare] = airfare_arr[idx].chomp
      hash[:hotel_price] = hotel_price_arr[idx].chomp
      arr << hash
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
