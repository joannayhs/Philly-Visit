require "pry"
require "open-uri"
require "nokogiri"

class Scraper

  BASE_URL = "https://www.tripadvisor.com/Attractions-g60795-Activities-Philadelphia_Pennsylvania.html"

    def self.parse
      doc = Nokogiri::HTML(open(BASE_URL))
      list_items = doc.css("div.attractions-attraction-overview-pois-PoiInfo__info--239IR>div div:nth-child(2) a.attractions-attraction-overview-pois-PoiInfo__name--SJ0a4").map{|attractions| attractions.text}
      #creates an array of attractions
    end

    def self.activity #gets the surface level of each activity to create the output list.
      parse.map{|activity| activity.text.strip} #creates an array with the section headings from the website. They will be the titles of the Activity class.
    end

    # def self.urls'
    #   parse.map{|link| link.attr("href")} #creates an array of urls for each activity. These become the links used in the second level of scraping.
    # end

    def self.parse_attraction_pages #scrapes the second level. pulls the information about each activity.
      attractions = {}
      Scraper.urls.each do |url|
        doc = Nokogiri::HTML(open(url)) #want to create a new activity from these urls
        binding.pry
      end
    end

end

#rel="noopener noreferrer"
# div.attractions-attraction-overview-pois-PoiInfo__info--239IR>div div:nth-child(2)

Scraper.parse
