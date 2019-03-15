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
      puts "\n Pick a mountain to get the skinny on the slopes! (or type 'exit' to bail)"
      @input = gets.strip
      if @input.to_i > 0 && @input.to_i - 1  < @resorts.length
        puts @resorts[@input.to_i - 1].values[2]
        menu_2
      elsif @input.to_i > @resorts.length || (@input.to_i == 0 && @input != "exit")
        puts "Pick a real mountain, grom!"
      end
    end 
  end 
  
  def menu_2
    puts "\nWant the nitty gritty deets? (type 'y' or 'n')"
    input_2 = gets.strip 
    if input_2 == "y"
      puts @resorts[@input.to_i - 1].values[3]
      menu_3
    elsif input_2 == "n"
    end 
  end 
  
  def menu_3
    puts "\nWant to check the freshies?"
    input_3 = gets.strip
    if input_3 == "y"
      puts "There's been (num) new snow in the last 24 hours, and (num_2) new snow in the last 72 hours!"
      elsif input_3 == "n"
    end 
  end 
  
  def outro
      puts "Happy skiing, ya PowderHound!"
  end 
  
end