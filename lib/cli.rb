class CLI

  def call
    welcome
    list_activities
  end

  def welcome
    puts "Welcome to Philadelphia, the City of Brotherly Love!"
  end

  def list_activities
    puts "Is this your first time here? (Y/N)"
    input = gets.strip.upcase
    if input == "Y"
      puts "List of all activities. Which activity would you like to know more about? (1-10) Type exit to exit"
    end
  end
end
