require 'pry'
class WashingtonSkiReport::CLI 
  
  def call 
    welcome 
    list_resorts
    menu 
    goodbye
  end 
  
  def welcome 
    puts "Welcome to your Washington ski resort report!"
  end 
  
  def list_resorts
    @resorts = WashingtonSkiReport::Resorts.all
    @resorts.each.with_index(1) do |resort, i|
      puts "#{i}. #{resort.values[0]} - #{resort.values[1]}"
    end 
  end 
  
  def menu 
    input = nil 
    while input != "exit"
      puts "Pick a mountain to get the skinny on the slopes! (or type 'exit' to exit)"
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