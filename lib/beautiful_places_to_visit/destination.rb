class BeautifulPlacesToVisit::Destination
  attr_reader :destination, :description, :airfare, :hotel_cost_per_night, :cost_to_spend_a_week_for_two, :image_url
  @@all = []  #stores all the instance destination objects

  def initialize(destination, description, costs_arr, image_url)  #initializes and creates destination object
    @destination = destination
    @description = description
    @airfare = costs_arr[0]
    @hotel_cost_per_night = costs_arr[1]
    @cost_to_spend_a_week_for_two = costs_arr[2]
    @image_url = image_url
    @@all << self
  end
 
  def self.all  #calls the @@all variable
    @@all
  end

  def self.retrieve_info(input)  #retrieves destination objects based on user's input
    all[input]
  end
end
