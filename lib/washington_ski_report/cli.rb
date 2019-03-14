class WashingtonSkiReport::CLI 
  
  def call 
    puts "Welcome to your Washington ski resort report!"
    list_resorts
    menu 
  end 
  
  def list_resorts
    puts " 
      1. Mt. Baker - open 
      2. Alpental - open 
      3. Crystal - open
      "
  end 
  
  def menu 
    puts "Select the resort you'd like more information about."
  end 
  
end