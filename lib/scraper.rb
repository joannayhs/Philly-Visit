require "pry"
require "open-uri"
require "nokogiri"

class Scraper

  BASE_URL = "https://www.visitphilly.com/articles/philadelphia/most-essential-things-to-do-in-philadelphia/"

    def self.parse
      doc = Nokogiri::HTML(open(BASE_URL))
      section_headings = doc.css("h2.vp-article-section__heading a")
    end

    def self.activity #gets the surface level of each activity to create the output list.
      parse.map{|activity| activity.text.strip} #creates an array with the section headings from the website. They will be the titles of the Activity class.
    end

    def self.urls
      parse.map{|link| link.attr("href")} #creates an array of urls for each activity. These become the links used in the second level of scraping.
    end

    def self.parse_attraction_pages #scrapes the second level. pulls the information about each activity.
      attractions = {}
      Scraper.urls.each do |url|
        doc = Nokogiri::HTML(open(url)) #want to create a new activity from these urls
        binding.pry
      end
    end

end

Scraper.parse_attraction_pages
