
class Attraction
#a new activity should be initialized with all of its information
#it has a title
#it has an about
#it has a location
#it has hours
#it keeps track of all the attractions

attr_accessor :title, :about, :location
@@all = []

def initialize(attractions_hash)
  attractions_hash.each do |key, value|
    self.send("#{key}=", value)
  end
    @@all << self
end

def self.all
  @@all
end

end
