require "pry"
require "open-uri"
require "nokogiri"

require_relative "./attraction.rb"

class Scraper

  BASE_URL = "https://www.tripadvisor.com/Attractions-g60795-Activities-Philadelphia_Pennsylvania.html"

    def self.parse
      doc = Nokogiri::HTML(open(BASE_URL))
    end

    def self.attractions #gets the surface level of each activity to create the output list.
      list_items = Scraper.parse.css("div.attractions-attraction-overview-pois-PoiInfo__info--239IR>div div:nth-child(2) a.attractions-attraction-overview-pois-PoiInfo__name--SJ0a4").map{|attractions| attractions.text}
      #creates an array of attractions
      #used in CLI to list attractions
    end

    def self.urls
      list_items = Scraper.parse.css("div.attractions-attraction-overview-pois-PoiInfo__info--239IR>div div:nth-child(2) a.attractions-attraction-overview-pois-PoiInfo__name--SJ0a4").map{|attractions| "https://www.tripadvisor.com"+"#{attractions.attr('href')}"}
      #creates an array of attraction urls to parse
      #used in parse_attraction_pages method to create hash
    end

    def self.parse_attraction_pages #scrapes the second level. pulls the information about each activity.
      attractions = {}
      Scraper.urls.each do |url|
        doc = Nokogiri::HTML(open(url)) #creates new key value pairs in the hash.
        binding.pry
        attractions[:title] = doc.css("#HEADING").text #title
        attractions[:about] = doc.css("div.attractions-attraction-detail-about-card-Description__modalText--1oJCY").text #about
        attractions[:location] = doc.css("div.detail_section address span.street-addess + span.locality").text #location
        attractions[:hours] = doc.css("span.ui_column is-4 attractions-attraction-detail-about-card-OpenHours__dayRange--3hPdS") + url.css("span.ui_column is-8 attractions-attraction-detail-about-card-OpenHours__timeRange--3p3_Z").text
      end
      attractions #this hash will be passed into a method in the Attraction class
    end

end

Scraper.parse_attraction_pages
