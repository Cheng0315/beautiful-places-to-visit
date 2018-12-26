class BeautifulPlacesToVisit::Scraper

  def scrape_page  #scrapes the web-page using nokogiri
    @doc = Nokogiri::HTML(open("http://time.com/money/page/best-places-to-travel-2018/"))
  end

  def destinations  #scrapes the name of the destinations and store them in an array
    @doc.css("section.chapter h2").collect {|d| d.text.scan(/[A-Z].+/)}.flatten
  end

  def costs_arr  #scrapes the prices of hotel cost, airfare, and cost to spend a week for two and store them in an array
    @doc.css("section.chapter h2 + p").collect {|i| i.text.scan(/\$\d+,?\d+/)}
  end

  def descriptions  #scrapes the description of the destinations and store them in an array
    @doc.css("section.chapter h2 + p + p").collect {|i| i.text}
  end

  def image_urls  #scrapes the image url of the destinations and store them in an array
    @doc.css("section.chapter img").collect {|m| m.attribute("src").value}.reject.with_index{|e, i| i == 10 || i ==11}
  end

  def create_destinations_info  #creates the destination info
    scrape_page
    destinations.each_with_index {|d, i| BeautifulPlacesToVisit::Destination.new(d, descriptions[i], costs_arr[i], image_urls[i])}
  end
end
