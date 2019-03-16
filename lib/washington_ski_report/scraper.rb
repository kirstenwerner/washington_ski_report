class WashingtonSkiReport::Scraper
  
  def scrape 
    doc = Nokogiri::HTML(open('http://www.skibum.net/west-coast/washington-ski-areas/'))
    resorts = doc.css('p')
    
    resorts.map do |resort|
      specs_and_skinny = resort.text
      if resort.css('a').length > 0  && resort.css('b').length > 0 && specs_and_skinny.include?("Specs:")

          name = resort.css('a').first.text 
          location_and_stats = resort.css('b').first.children.last.text
          url = resort.css('b').css('a').first['href']
          
          las_array = location_and_stats.split((/(\d+)/))
          location = las_array[0].gsub(", ", "").gsub(" • ", '')
          stats = las_array[1..4].join
          sas_array = specs_and_skinny.split("\n")
          deets = sas_array[1].gsub(" Specs: ", "")
          skinny = sas_array[2].gsub(" The SKInny: ", "")
      
          @@resort_details = {:name => name, :location => location, :skinny => skinny, :deets => deets, :url => url}
      end 
    end 
  end 
  
  def scrape_snow
    doc = Nokogiri::HTML(open('http://www.skicentral.com/washington-skireport.html'))
    resort_names = doc.css('div').css('a')[10..29].map.with_index {|name, i| name if i%2 == 0}
    name = resort_names.map {|resort| resort.text if resort != nil} - [nil]
    binding.pry
  end 
  
end 