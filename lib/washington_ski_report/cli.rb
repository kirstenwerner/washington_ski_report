require 'pry'
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
    @resorts.each.with_index(1) do |resort, i|
      puts "#{i}. #{resort.name} - #{resort.status}"
    end 
  end 
  
  def menu 
    input = nil 
    while input != "exit"
      puts "Select the resort you'd like more information about, or enter 'exit' to exit."
      input = gets.strip
      if input.to_i > 0 && input.to_i - 1  < @resorts.length
        puts @resorts[input.to_i - 1]
      elsif input.to_i > @resorts.length || (input.to_i == 0 && input != "exit")
        puts "Please enter a valid selection"
      end
    end 
  end 
  
  def goodbye
    puts "Happy skiing, ya PowderHound!"
  end 
  
end