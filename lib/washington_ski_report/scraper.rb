class WashingtonSkiReport::Scraper
  
  def scrape 
    doc = Nokogiri::HTML(open(https://www.onthesnow.com/washington/skireport.html))
  end 
  
end 