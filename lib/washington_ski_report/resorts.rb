class WashingtonSkiReport::Resorts
  attr_accessor :name, :location, :skinny, :deets, :url
  @@all = []

  def self.all 
    @@all = WashingtonSkiReport::Scraper.new.scrape - [nil]
    @@all.each do |resort|
      @name = resort.values[0]
      @location = resort.values[1]
      @skinny = resort.values[2]
      @deets = resort.values[3]
      @url = resort.values[4]
    end 
    # @@all_snow = WashingtonSkiReport::Scraper.new.scrape_snow
  end 
  
  def self.all_snow
    @@all_snow = WashingtonSkiReport::Scraper.new.scrape_snow
  end 
  
  # def self.url_link
  #   @@all_links = []
  #   @@all.each do |resort|
  #     @@all_links << resort.values[4] 
  #   end
  # end 
end 