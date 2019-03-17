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
          

          @@resort_details = {:name => name, :location => location, :skinny => skinny, :deets => deets, :url => url, :stats => stats}
      end 
    end 
  end 
  
  def scrape_snow
    doc = Nokogiri::HTML(open('http://www.skicentral.com/washington-skireport.html'))
    
    resort_names = doc.css('div').css('a')[10..29].map.with_index {|name, i| name if i%2 == 0}
    name_array = resort_names.map {|resort| resort.text if resort != nil} - [nil]
    url_array = resort_names.map {|resort| resort['href'] if resort != nil} - [nil]
    
    @i = 0
    @@gnar_details = []
    
    url_array.map do |url| 
      doc_url = Nokogiri::HTML(open('http://www.skicentral.com/' + url))
      
      new_snow = doc_url.css('table').css('td')[13].text
      new_snow_detail = doc_url.css('table').css('td')[15].text
      season_total = doc_url.css('table').css('td')[17].text
      surface_conditions = doc_url.css('table').css('td')[9].text
      secondary_surface_conditions = doc_url.css('table').css('td')[11].text
      base_depth = doc_url.css('table').css('td')[4].text
      runs_open = doc_url.css('table').css('td')[5].text.gsub(" ", '').gsub("\n", " ")
      lifts_open = doc_url.css('table').css('td')[6].text.gsub(" ", '').gsub("\n", " ")
      percent_open = doc_url.css('table').css('td')[7].text
      forcast_weather = doc_url.css('table').css('td')[27].text
      forcast_base_temp = doc_url.css('table').css('td')[29].text
      forcast_summit_temp = doc_url.css('table').css('td')[31].text
      
      @@gnar_details << {:name => name_array[@i], :new_snow => new_snow, :new_snow_detail => new_snow_detail, :season_total => season_total, :surface_conditions => surface_conditions, :secondary_surface_conditions => secondary_surface_conditions, :base_depth => base_depth, :runs_open => runs_open, :lifts_open => lifts_open, :percent_open => percent_open, :forcast_weather => forcast_weather, :forcast_base_temp => forcast_base_temp, :forcast_summit_temp => forcast_summit_temp}
      
      @i += 1 
    end 
    @@gnar_details
  end 
end 