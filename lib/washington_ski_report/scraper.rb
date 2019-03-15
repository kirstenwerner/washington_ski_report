class WashingtonSkiReport::Scraper
  
  def scrape 
    doc = Nokogiri::HTML(open('http://www.skibum.net/west-coast/washington-ski-areas/'))

    name = doc.css('p').css('a').first.text
    url = doc.css('p').css('a').first['href']
    location_and_stats = doc.css('p').css('b').first.children.last.text
    las_array = location_and_stats.split((/(\d+)/))
    location = 
    specs_and_skinny = doc.css('p')[1].text
    sas_array = specs_and_skinny.split("\n")
    specs = sas_array[1].gsub(" Specs: ", "")
    skinny = sas_array[2].gsub(" The SKInny: ", "")
    
    binding.pry 
    
  end 
  
end 