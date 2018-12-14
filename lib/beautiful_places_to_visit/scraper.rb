class BeautifulPlacesToVisit::Scraper

  def scrape_page
    Nokogiri::HTML(open("http://time.com/money/page/best-places-to-travel-2018/"))
  end

  def create_us_destionations
    scrape_page.css("section.chapter h2").text
    destinations = scrape_page.css("section.chapter h2:not(h1:nth-of-type(3) h2)").text:not(h2)").collect {|d| d.text}
    costs_arr = scrape_page.css("section.chapter h2 + p").collect {|i| i.text.scan(/\$\d+,?\d+/)}
    description = scrape_page.css("section.chapter h2 + p + p").collect {|i| i.text}
    images = scrape_page.css("section.chapter img").collect {|i| i.attribute("src").value}.reject.with_index{|e, i| i == 10 || i ==11}
    number_of_places = scrape_page.css("section.chapter h2").collect {|name| name.text}.count
  end

  def create_international_destionations
    destinations = scrape_page.css("section.chapter h1:nth-of-type(3) ~ h2").collect {|d| d.text}
    costs_arr = scrape_page.css("section.chapter h1:nth-of-type(3) ~ h2 + p").collect {|c| c.text.scan(/\$\d+,?\d+/)}
    description = scrape_page.css("section.chapter h1:nth-of-type(3) ~ h2 + p + p").collect {|t| t.text}
    images = scrape_page.css("section.chapter img").collect {|m| m.attribute("src").value}.reject.with_index{|e, i| i == 10 || i ==11}

  end
end
