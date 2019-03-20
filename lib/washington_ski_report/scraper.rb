class WashingtonSkiReport::Scraper
  
  def scrape 
    doc = Nokogiri::HTML(open('http://www.skibum.net/west-coast/washington-ski-areas/'))
    resorts = doc.css('p')
    
    resorts.map do |resort|
      specs_and_skinny = resort.text
      if resort.css('a').length > 0  && resort.css('b').length > 0 && specs_and_skinny.include?("Specs:")

          name = resort.css('a').first.text.gsub("°", "") 
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
    corrected_name_array = name_array.map {|name| name.gsub("Mount", "Mt.").gsub("Pas", "Pass").gsub("Mt.ain", "Mountain")}
    url_array = resort_names.map {|resort| resort['href'] if resort != nil} - [nil]
    
    @i = 0
    @@gnar_details = []
    
    url_array.map do |url| 
      doc_url = Nokogiri::HTML(open('http://www.skicentral.com/' + url))
      
      doc_url.css('table').css('td').each.with_index do |object, i|
         if object.text == "New Snow:"
           @new_snow = doc_url.css('table').css('td')[i + 1].text
         elsif object.text == "7 Day Details"
           @new_snow_detail = doc_url.css('table').css('td')[i + 1].text.gsub("   ", " - ").split("\"").map {|str| str + "\""}.join(", ")
         elsif object.text == "Season Total"
           @season_total = doc_url.css('table').css('td')[i + 1].text
         elsif object.text == "Primary Surface Conditions:"
           @surface_conditions = doc_url.css('table').css('td')[i + 1].text
         elsif object.text == "Secondary Surface Conditions:"
           @secondary_surface_conditions = doc_url.css('table').css('td')[i + 1].text
         elsif object.text == "Base Depth"
           @base_depth = doc_url.css('table').css('td')[i + 4].text
         elsif object.text == "Runs Open"
          @runs_open = doc_url.css('table').css('td')[i + 4].text.gsub("\n", "").gsub('to', 't o').gsub('of', 'of ').gsub(/[ ]{2,}/, " ")
         elsif object.text == "Lifts Open"
           @lifts_open = doc_url.css('table').css('td')[i + 4].text.gsub("\n", "").gsub('to', 't o').gsub('of', 'of ').gsub(/[ ]{2,}/, " ")
         elsif object.text == "Percent Open"
           @percent_open = doc_url.css('table').css('td')[i + 4].text
         elsif object.text == "Forecast Weather"
           @forcast_weather = doc_url.css('table').css('td')[i + 1].text
         elsif object.text == "Forecast Base Temperature"
           @forcast_base_temp = doc_url.css('table').css('td')[i + 1].text
         elsif object.text == "Forecast Summit Temperature"
           @forcast_summit_temp = doc_url.css('table').css('td')[i + 1].text
         end 
       end 
       binding.pry

      @@gnar_details << {:name => name_array[@i], :new_snow => @new_snow, :new_snow_detail => @new_snow_detail, :season_total => @season_total, :surface_conditions => @surface_conditions, :secondary_surface_conditions => @secondary_surface_conditions, :base_depth => @base_depth, :runs_open => @runs_open, :lifts_open => @lifts_open, :percent_open => @percent_open, :forcast_weather => @forcast_weather, :forcast_base_temp => @forcast_base_temp, :forcast_summit_temp => @forcast_summit_temp}
      @i += 1 
    end 
    @@gnar_details
  end 
end 