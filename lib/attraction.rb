require_relative "./scraper.rb"

class Attraction
#a new activity should be initialized with all of its information
#it has a title
#it has an about
#it has a location
#it has hours
#it keeps track of all the attractions

attr_accessor :title, :about, :location, :hours
@@all = []

def initialize(title =nil, about = nil, location = nil, hours = nil, url = nil)
  @title, @about, @location, @hours, @url = title, about, location, hours, url
  @@all << self
end

def create_from_index(hash)
  hash.each do |key, value|
    self.send(":#{key}=", "#{value}")
  end
end

end

Attraction.create_from_index(Scraper.parse_attraction_pages)
