class BeautifulPlacesToVisit::Scraper

  def scrape_page
    Nokogiri::HTML(open("http://time.com/money/page/best-places-to-travel-2018/"))
  end

  def destinations
    scrape_page.css("section.chapter h2").collect {|d| d.text.scan(/[A-Z].+/)}.flatten
  end

  def costs_arr
    scrape_page.css("section.chapter h2 + p").collect {|i| i.text.scan(/\$\d+,?\d+/)}
  end

  def descriptions
    scrape_page.css("section.chapter h2 + p + p").collect {|i| i.text}
  end

  def image_urls
    scrape_page.css("section.chapter img").collect {|m| m.attribute("src").value}.reject.with_index{|e, i| i == 10 || i ==11}
  end

  def create_destinations_info
    destinations.each_with_index {|d, i| BeautifulPlacesToVisit::Destination.new(d, descriptions[i], costs_arr[i], image_urls[i])}
  end
end
