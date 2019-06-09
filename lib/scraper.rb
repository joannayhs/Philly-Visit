require "pry"
require "open-uri"
require "nokogiri"


class Scraper

  BASE_URL = "https://www.tripadvisor.com/Attractions-g60795-Activities-Philadelphia_Pennsylvania.html"



    def self.parse
      doc = Nokogiri::HTML(open(BASE_URL))
    end

    def self.attractions #gets the surface level of each activity to create the output list.
      list_items = Scraper.parse.css("div.attractions-attraction-overview-pois-PoiInfo__info--239IR>div div:nth-child(2) a.attractions-attraction-overview-pois-PoiInfo__name--SJ0a4").map{|attractions| attractions.text}
      #creates an array of attractions
    end

    def self.urls
      list_items = Scraper.parse.css("div.attractions-attraction-overview-pois-PoiInfo__info--239IR>div div:nth-child(2) a.attractions-attraction-overview-pois-PoiInfo__name--SJ0a4").map{|attractions| "https://www.tripadvisor.com/#{attractions.attr('href')}"}
      #creates an array of attraction urls to parse
    end

    def self.parse_attraction_pages #scrapes the second level. pulls the information about each activity.
      Scraper.urls.each do |url|
        doc = Nokogiri::HTML(open(url)) #want to create a new activity from these urls
        Attraction.create_from_index(doc)
        binding.pry
      end
    end

end


Scraper.parse_attraction_pages
