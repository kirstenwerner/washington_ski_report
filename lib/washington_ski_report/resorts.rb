class WashingtonSkiReport::Resorts
  attr_accessor :name, :status 
  
  WashingtonSkiReport::Scraper.new
  
  def self.all 
    resort = self.new 
    resort.name = "resort name"
    resort.status = "open"
    
    [resort] 
  end 
  
end 