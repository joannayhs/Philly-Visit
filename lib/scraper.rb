require "nokogiri"
require "open-uri"
require "pry"

class Scraper

  def self.scrape_from_url(url)
    url = "https://www.visitphilly.com/articles/philadelphia/most-essential-things-to-do-in-philadelphia/"
    page = open(url)
    doc = Nokogirl::HTML(page)
  end


end
