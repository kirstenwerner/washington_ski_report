require 'pry'
class WashingtonSkiReport::CLI 
  
  def call 
    intro 
    list_resorts
    menu 
    outro
  end 
  
  def intro 
    puts "Welcome to your Washington ski resort report! \n "
  end 
  
  def list_resorts
    @resorts = WashingtonSkiReport::Resorts.all
    @resorts.each.with_index(1) do |resort, i|
      puts "#{i}. #{resort.values[0]} - #{resort.values[1]}"
    end 
  end 
  
  def menu 
    @input = nil 
    while @input != "exit"
      puts "\n Pick a mountain to get the skinny on the slopes! (or type 'exit' to exit)"
      @input = gets.strip
      if @input.to_i > 0 && @input.to_i - 1  < @resorts.length
        puts @resorts[@input.to_i - 1].values[2]
        menu_2
      elsif @input.to_i > @resorts.length || (@input.to_i == 0 && @input != "exit")
        puts "Please enter a valid selection"
      end
    end 
  end 
  
  def menu_2
    puts "\nWant the nitty gritty deets?"
    input_2 = gets.strip 
    if input_2 == "y"
      puts @resorts[@input.to_i - 1].values[3]
    end 
  end 
  
  def outro
    puts "Happy skiing, ya PowderHound!"
  end 
  
end