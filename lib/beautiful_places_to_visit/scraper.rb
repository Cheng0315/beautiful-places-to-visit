class BeautifulPlacesToVisit::Scraper

  def scrape_page
    doc = Nokogiri::HTML(open("http://time.com/money/page/best-places-to-travel-2018/"))
    destination = doc.css("section.chapter h2").text
    binding.pry
  end

  def get_us
    scrape_page.collect do |destination|
      destination_hash = {}
      destination_hash[:destination] = "i"
      destination_hash
    end
  end


end
