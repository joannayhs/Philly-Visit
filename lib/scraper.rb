require "pry"
require "open-uri"
require "nokogiri"

class Scraper

  BASE_URL = "https://www.visitphilly.com/articles/philadelphia/most-essential-things-to-do-in-philadelphia/"

  def get_page
    Nokogiri::HTML(open(BASE_URL))
  end

  def scrape_main_page
    self.get_page.css("h2.vp-article-section__heading a")
  end

  def create_activity
    scrape_main_page.each do |activity|
      Activity.new(activity)
    end
  end

end


# def self.activity
#   page = open(BASE_URL)
#   doc = Nokogiri::HTML(page)
#   section_headings = doc.css("h2.vp-article-section__heading a")
#   activity = section_headings.map{|activity| activity.text.strip}
#   @links = section_headings.map{|link| link.attr("href")}
# end

# def self.scrape_info_page
#   attractions = {}
#   @links.each do |link|
#   page = open(link)
#   doc = Nokogiri::HTML(page)
#   binding.pry
#   end
# end
