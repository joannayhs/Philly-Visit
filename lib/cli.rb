class CLI

  def call
    welcome
    list_activities
    goodbye
  end

  def welcome
    puts "Welcome to Philadelphia, the City of Brotherly Love!"
  end

  def list_activities
    puts "Is this your first time here? (Y/N)"
    input = nil
    while input != "exit"
      input = gets.strip.upcase
      if input == "Y"
        puts "Here is a list of the ten most essential things to do on your first visit to Philly:"
        puts "Which activity would you like to know more about? (1-10)"
        number = nil
        while number != "exit"
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
          else
            puts "Please enter a number between 1 and 10."
          end
        end
      elsif input == "N"
        goodbye
      end
    end
  end

  def goodbye
    puts "Enjoy your visit!"
  end
end
