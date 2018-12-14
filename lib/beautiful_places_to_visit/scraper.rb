class BeautifulPlacesToVisit::Scraper

  def scrape_page
    Nokogiri::HTML(open("http://time.com/money/page/best-places-to-travel-2018/"))
  end

  def create_destinations

    BeautifulPlacesToVisit::USDestination.new(destinations.slice(0, mid),descriptions.slice(0, mid), costs_arr.slice(0, mid), image_urls.slice(0, mid))



    BeautifulPlacesToVisit::InternationalDestination.new(destinations.slice(mid, max),descriptions.slice(mid, max), costs_arr.slice(mid, max), image_urls.slice(mid, max))

  end

  def create_destinations_international
    destinations.slice(mid, max).each {|destination| puts destination}
  end

  def destinations
    scrape_page.css("section.chapter h2").collect {|d| d.text}
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

  def mid
    scrape_page.css("section.chapter h2").collect {|d| d.text}.count - scrape_page.css("section.chapter h1:nth-of-type(3) ~ h2").collect {|d| d.text}.count
  end

  def max
    scrape_page.css("section.chapter h2").collect {|d| d.text}.count
  end
end
