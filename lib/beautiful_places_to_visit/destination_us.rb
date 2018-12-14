class BeautifulPlacesToVisit::USDestination
  attr_reader :destination, :description, :airfare, :hotel_cost_per_night, :cost_to_spend_a_week_for_two, :image_url
  @@all = []

  def initialize(destination, description, costs_arr, image_url)
    @destination = destination
    @description = description
    @airfare = costs_arr[0]
    @hotel_cost_per_night = costs_arr[1]
    @cost_to_spend_a_week_for_two = costs_arr[2]
    @image_url = image_url
    @@all << self
  end

  def self.all
    @@all
  end
end
