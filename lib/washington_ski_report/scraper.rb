class WashingtonSkiReport::Scraper
  
  def scrape 
    doc = Nokogiri::HTML(open('http://www.skibum.net/west-coast/washington-ski-areas/'))
    doc
    binding.pry 
    
    # name = doc.css('p').css('b').css('a').first.text
    # url = doc.css('p').css('b').css('a').first['href']
    # location_and_stats = doc.css('p').css('b').first.children.last.text
  end 
  
end 