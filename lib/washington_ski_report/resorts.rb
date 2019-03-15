class WashingtonSkiReport::Resorts
  attr_accessor :name, :status 
  
  
  def self.all 
    WashingtonSkiReport::Scraper.new.scrape

    resort = self.new 
    resort.name = "resort name"
    resort.status = "open"
    
    [resort] 
  end 
  
end 