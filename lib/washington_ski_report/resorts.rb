class WashingtonSkiReport::Resorts
  attr_accessor :name, :status 
  
  
  def self.all 
    WashingtonSkiReport::Scraper.new.scrape

    resort = self.new 
    resort.name = 'name' 
    resort.status = "open"
    
    [resort] 
  end 
  
end 