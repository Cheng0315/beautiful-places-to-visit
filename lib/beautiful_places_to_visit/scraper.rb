class BeautifulPlacesToVisit::Scraper

  def scrape_page
    Nokogiri::HTML(open("http://time.com/money/page/best-places-to-travel-2018/"))
  end

  def create_us_destinations
    range = scrape_page.css("section.chapter h2").collect {|d| d.text}.count - scrape_page.css("section.chapter h1:nth-of-type(3) ~ h2").collect {|d| d.text}.count
    destinations = scrape_page.css("section.chapter h2").collect {|d| d.text}.slice(0, range)
    costs_arr = scrape_page.css("section.chapter h2 + p").collect {|i| i.text.scan(/\$\d+,?\d+/)}.slice(0, range)
    description = scrape_page.css("section.chapter h2 + p + p").collect {|i| i.text}.slice(0, range)
    images = scrape_page.css("section.chapter img").collect {|m| m.attribute("src").value}.reject.with_index{|e, i| i == 10 || i ==11}.slice(0, range)
  end

  def create_international_destionations
    range = scrape_page.css("section.chapter h2").collect {|d| d.text}.count - scrape_page.css("section.chapter h1:nth-of-type(3) ~ h2").collect {|d| d.text}.count
    max_range = scrape_page.css("section.chapter h2").collect {|d| d.text}.count

    destinations = scrape_page.css("section.chapter h1:nth-of-type(3) ~ h2").collect {|d| d.text}
    costs_arr = scrape_page.css("section.chapter h1:nth-of-type(3) ~ h2 + p").collect {|c| c.text.scan(/\$\d+,?\d+/)}
    description = scrape_page.css("section.chapter h1:nth-of-type(3) ~ h2 + p + p").collect {|t| t.text}
    images = scrape_page.css("section.chapter img").collect {|m| m.attribute("src").value}.reject.with_index{|e, i| i == 10 || i == 11}.slice(range, max_range)
  end
end
