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

def create_from_index(url)
  Attraction.new(
    url.css("h1.ui_header h1").text, #title
    url.css("div.attractions-attraction-detail-about-card-Description__modalText--1oJCY").text, #about
    url.css("div.detail_section address span.street-addess + span.locality").text, #location
    url.css("span.ui_column is-4 attractions-attraction-detail-about-card-OpenHours__dayRange--3hPdS + span.ui_column is-8 attractions-attraction-detail-about-card-OpenHours__timeRange--3p3_Z").text,
  )
end

end
