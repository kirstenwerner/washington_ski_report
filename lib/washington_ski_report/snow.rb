class WashingtonSkiReport::Snow
  attr_accessor :name, :new_snow, :new_snow_detail, :season_total, :surface_conditions, :secondary_surface_conditions, :base_depth, :runs_open, :lifts_open, :percent_open, :forcast_weather, :forcast_base_temp, :forcast_summit_temp
  @@all = []
  
  def self.all
    @@all = WashingtonSkiReport::Scraper.new.scrape_snow
    @sorted_gnar_details = @@all.sort_by {|key, value| key[:name]}
    binding.pry
  end 
end 

# @@gnar_details << {:name => name_array[@i], :new_snow => new_snow, :new_snow_detail => new_snow_detail, :season_total => season_total, :surface_conditions => surface_conditions, :secondary_surface_conditions => secondary_surface_conditions, :base_depth => base_depth, :runs_open => runs_open, :lifts_open => lifts_open, :percent_open => percent_open, :forcast_weather => forcast_weather, :forcast_base_temp => forcast_base_temp, :forcast_summit_temp => forcast_summit_temp}
      