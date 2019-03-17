class WashingtonSkiReport::Resorts
  attr_accessor :name, :location, :skinny, :deets, :url, :stats
  @@all = []

  def self.all 
    @@all = WashingtonSkiReport::Scraper.new.scrape - [nil]
    @@all.each do |resort|
      @name = resort.values[0]
      @location = resort.values[1]
      @skinny = resort.values[2]
      @deets = resort.values[3]
      @url = resort.values[4]
      @stats = resort.values[5]
    end 
  end 
end 