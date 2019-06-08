class CLI

  def call
    welcome
    yes_or_no
  end

  def welcome
    puts "Welcome to Philadelphia, the City of Brotherly Love!"
  end

  def yes_or_no
    puts "Is this your first time here? (Y/N)"
    input = gets.strip.upcase
    if input == "Y"
      activity_list
    elsif input == "N"
      goodbye
    end
  end

  def activity_list
    puts "Here is a list of the ten most essential things to do on your first visit to Philly:"
    number = nil
    while number != "exit"
      puts "Which activity would you like to know more about? (1-10)"
      puts "When finished, type 'exit'"
      puts "list of activities"
      number = gets.strip
      case number
        when "1"
          puts "first activity"
        when "2"
          puts "second activity"
        when "3"
          puts "third activity"
        when "4"
          puts "fourth activity"
        when "5"
          puts "fifth activity"
        when "6"
          puts "sixth activity"
        when "7"
          puts "seventh activity"
        when "8"
          puts "eighth activity"
        when "9"
          puts "ninth activity"
        when "10"
          puts "tenth activity"
        when "exit"
          goodbye
        else
          puts "Please enter a number 1-10:"
        end
      end
  end

  def goodbye
    puts "Enjoy your visit!"
  end
end
