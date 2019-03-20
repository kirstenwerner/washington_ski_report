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
      puts "\nPick a mountain to get the skinny on the slopes! (or type 'list' to see your mountain options again, or 'exit' to bail)".colorize(:cyan).bold
      @input = gets.strip
      if @input == 'list'
        list_resorts
      elsif @input.to_i > 0 && @input.to_i - 1  < @resorts.length
        puts "\n" + (@resorts[@input.to_i - 1].values[0] +" - " + @resorts[@input.to_i - 1].values[5]).bold
        puts @resorts[@input.to_i - 1].values[2]
        menu_2
      elsif @input.to_i > @resorts.length + 1 || (@input.to_i == 0 && @input != "exit")
        puts "Don't be a grom, pick a real mountain!".colorize(:cyan).bold
      end
    end 
  end 
  
  def menu_2
    puts "\nWant the nitty gritty deets? (type 'y' or 'n')".colorize(:cyan).bold
    input_2 = gets.strip 
    if input_2 == "y"
      puts "\n"
      resort_details = @resorts[@input.to_i - 1].values[3].split(".") - [" "]
      resort_details.each {|fact| puts "* " + fact.strip}
      # binding.pry
      puts "\nIf you want to get even deeper in the gnar, visit " + @resorts[@input.to_i - 1].values[4].bold
      menu_3
    elsif input_2 == "n"
    end 
  end 
  
  def menu_3
    puts "\nWant to check the freshies? (type 'y' or 'n')".colorize(:cyan).bold
    input_3 = gets.strip
    if input_3 == "y"
      @snow_report = WashingtonSkiReport::Snow.all 
      @snow_report_resorts = []
      
      @snow_report.each.with_index do |resort, i| 
        @snow_report_resorts << resort.values[0]
      end 
      
      if @snow_report_resorts.include?(@resorts[@input.to_i - 1].values[0]) == true
        input_4 = @snow_report_resorts.index{|x| x == @resorts[@input.to_i - 1].values[0]}
        puts "\n" + @snow_report[input_4].values[0]
        
        puts "NEW SNOW:                              " + @snow_report[input_4].values[1] 
        puts "NEW SNOW DETAILS:                      " + @snow_report[input_4].values[2] 
        puts "TOTAL SNOW FOR THE SEASON SO FAR:      " + @snow_report[input_4].values[3] 
        puts "BASE DEPTH:                            " + @snow_report[input_4].values[6] 
        puts "SURFACE CONDITIONS:                    " + @snow_report[input_4].values[4] 
        puts "SECONDARY SURFACE CONDITIONS:          " + @snow_report[input_4].values[5] 
        puts "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
        puts "RUNS OPEN:                             " + @snow_report[input_4].values[7] 
        puts "LIFTS OPEN:                            " + @snow_report[input_4].values[8] 
        puts "PERCENT OPEN:                          " + @snow_report[input_4].values[9] 
        puts "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
        puts "WEATHER FORCAST:                       " + @snow_report[input_4].values[10] 
        puts "FORCAST BASE TEMPERATURE:              " + @snow_report[input_4].values[11] 
        puts "FORCAST SUMMIT TEMPERATURE:            " + @snow_report[input_4].values[12] 
      else 
        puts "\nSorry, dude, info not available"
      end 
      elsif input_3 == "n"
    end
  end 
  
  def outro
      puts "\nHappy skiing, ya PowderHound!\n".colorize(:cyan).bold
  end 
  
end