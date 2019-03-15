class WashingtonSkiReport::Scraper
  
  def scrape 
    doc = Nokogiri::HTML(open('http://www.skibum.net/west-coast/washington-ski-areas/'))
    resorts = doc.css('p')
    
    resorts.map do |resort|
      specs_and_skinny = resort.text
      if resort.css('a').length > 0  && resort.css('b').length > 0 && specs_and_skinny.include?("Specs:")

          name = resort.css('a').first.text 
          location_and_stats = resort.css('b').first.children.last.text
      
          las_array = location_and_stats.split((/(\d+)/))
          location = las_array[0].gsub(", ", "")
          stats = las_array[1..4].join
          sas_array = specs_and_skinny.split("\n")
          deets = sas_array[1].gsub(" Specs: ", "")
          skinny = sas_array[2].gsub(" The SKInny: ", "")
      
          @@resort_details = {:name => name, :location => location, :skinny => skinny, :deets => deets}
      end 
    end 
  end 
  
  def scrape_snow
    doc = Nokogiri::HTML(open('https://www.google.com/search?q=washington+ski+resorts&oq=washington+ski+resorts&aqs=chrome.0.69i59j69i60j0l2j69i60l2.5305j0j4&sourceid=chrome&ie=UTF-8'))
    # binding.pry
  end 
  
end 