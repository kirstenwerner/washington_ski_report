class WashingtonSkiReport::CLI 
  
  def call 
    list_resorts
    menu 
  end 
  
  def list_resorts
    puts "Welcome to your Washington ski resort report! \n"
    puts " 
      1. Mt. Baker - open 
      2. Alpental - open 
      3. Crystal - open
      "
  end 
  
  def menu 
    puts "Select the resort you'd like more information about, or enter 'exit' to exit."
    input = gets.strip
    while input != "exit"
      case input 
      when '1' 
        puts ""
      when '2'
        puts '' 
      when '3'
        puts '' 
      end 
    end 
  end 
  
end