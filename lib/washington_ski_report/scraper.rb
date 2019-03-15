class WashingtonSkiReport::Scraper
  
  def scrape 
    doc = Nokogiri::HTML(open('http://skiwashington.com/resorts/'))
    doc
    binding.pry 
  end 
  
end 