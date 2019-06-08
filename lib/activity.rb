class Activity
attr_accessor :title, :overview, :location_and_contact, :admission_info, :url
@@all = []

def initialize(title = nil, overview = nil, location_and_contact = nil, admission_info = nil, url = nil)
  @title, @overview, @location_and_contact, @admission_info, @url = title, overview, location_and_contact, admission_info, url
  @@all << self
end

def self.all
  @@all
end

end
