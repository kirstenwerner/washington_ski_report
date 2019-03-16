require 'pry'
class WashingtonSkiReport::CLI 
  
  def call 
    intro 
    list_resorts
    menu 
    outro
  end 
  
  def intro 
    puts "\nWelcome to your Washington ski resort report! \n ".colorize(:cyan).bold
  end 
  
  def list_resorts
    @resorts = WashingtonSkiReport::Resorts.all
    @resorts.each.with_index(1) do |resort, i|
      puts "#{i}. #{resort.values[0]} - #{resort.values[1]}".colorize(:light_yellow).bold
    end 
  end 
  
  def menu 
    @input = nil 
    while @input != "exit"
      puts "\nPick a mountain to get the skinny on the slopes! (or type 'exit' to bail)".colorize(:cyan).bold
      @input = gets.strip
      if @input.to_i > 0 && @input.to_i - 1  < @resorts.length
        puts "\n" + (@resorts[@input.to_i - 1].values[0] +" - " + @resorts[@input.to_i - 1].values[5]).bold
        puts @resorts[@input.to_i - 1].values[2]
        menu_2
      elsif @input.to_i > @resorts.length || (@input.to_i == 0 && @input != "exit")
        puts "Don't be a grom, pick a real mountain!".colorize(:cyan).bold
      end
    end 
  end 
  
  def menu_2
    puts "\nWant the nitty gritty deets? (type 'y' or 'n')".colorize(:cyan).bold
    input_2 = gets.strip 
    if input_2 == "y"
      puts "\n"
      @resorts[@input.to_i - 1].values[3].split(".").each {|fact| puts "* " + fact.strip}
      # puts "\n" + @resorts[@input.to_i - 1].values[3]
      # WashingtonSkiReport::Resorts.url_link
      puts "\nIf you want to get even deeper in the gnar, visit " + @resorts[@input.to_i - 1].values[4].bold
      menu_3
    elsif input_2 == "n"
    end 
  end 
  
  def menu_3
    puts "\nWant to check the freshies?".colorize(:cyan).bold
    input_3 = gets.strip
    if input_3 == "y"
      WashingtonSkiReport::Resorts.all_snow
      puts "\nThere's been (num) new snow in the last 24 hours, and (num_2) new snow in the last 72 hours!"
      elsif input_3 == "n"
    end 
  end 
  
  def outro
      puts "\nHappy skiing, ya PowderHound!\n".colorize(:cyan).bold
  end 
  
end