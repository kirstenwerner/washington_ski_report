class WashingtonSkiReport::Snow
  attr_accessor :name, :new_snow, :new_snow_detail, :season_total, :surface_conditions, :secondary_surface_conditions, :base_depth, :runs_open, :lifts_open, :percent_open, :forcast_weather, :forcast_base_temp, :forcast_summit_temp
  @@all = []
  @@sorted_gnar_details = [] 
  
  def self.all
    @@all = WashingtonSkiReport::Scraper.new.scrape_snow
    @@sorted_gnar_details = @@all.sort_by {|key, value| key[:name]}
    
    @@sorted_gnar_details.each do |resort|
      @name = resort.values[0]
      @new_snow = resort.values[1]
      @new_snow_detail = resort.values[2].gsub("   ", " - ").split("\"").map {|str| str + "\""}.join("\n")
      @season_total = resort.values[3]
      @surface_conditions = resort.values[4]
      @secondary_surface_conditions = resort.values[5]
      @base_depth = resort.values[6]
      @runs_open = resort.values[7].gsub('to', 't o').gsub('of', 'of ')
      @lifts_open = resort.values[8].gsub('to', 't o').gsub('of', 'of ')
      @percent_open = resort.values[9]
      @forcast_weather = resort.values[10]
      @forcast_base_temp = resort.values[11]
      @forcast_summit_temp = resort.values[12]
      binding.pry
    end 
  end 
end 

