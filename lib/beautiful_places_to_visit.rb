require "nokogiri"
require "pry"
require "open-uri"

require_relative "./beautiful_places_to_visit/version"
require_relative "./beautiful_places_to_visit/cli"
require_relative "./beautiful_places_to_visit/us_destination"
require_relative "./beautiful_places_to_visit/scraper"
require_relative "./beautiful_places_to_visit/international_destination"

module BeautifulPlacesToVisit
  class Error < StandardError; end
  # Your code goes here...
end
