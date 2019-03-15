class WashingtonSkiReport::CLI 
  
  def call 
    welcome 
    list_resorts
    menu 
    goodbye
  end 
  
  def welcome 
    puts "Welcome to your Washington ski resort report! \n"
  end 
  
  def list_resorts
    @resorts = WashingtonSkiReport::Resorts.all 
  end 
  
  def menu 
    input = nil 
    while input != "exit"
    puts "Select the resort you'd like more information about, or enter 'exit' to exit."
    input = gets.strip
      case input 
      when '1' 
        puts 'INFO ABOUT MT. BAKER'
      when '2'
        puts 'INFO ABOUT ALPENTAL' 
      when '3'
        puts 'INFO ABOUT CRYSTAL' 
      end 
    end 
  end 
  
  def goodbye
    puts "Happy skiing, ya PowderHound!"
  end 
  
end