class StockChecker::CLI

  def call 
    @stock_list = []

    print_welcome_message
    fill_stock_list
    display_stock_list

    menu
  end

  def menu
    puts "\nWhat would you like to do?"
    puts "Enter the list number of a given stock for more info., 'sort' to sort the list, and 'exit to leave end the program."
    puts

    input = gets.strip
    puts

    while input != "exit"
      if input.to_i.to_s == input # Checks if the input is an integer
        handle_detail_display
      elsif input == "sort"
        puts "SORTING LIST"
      end
      puts "\nWhat would you like to do?"
      puts "Enter the list number of a given stock for more info., 'sort' to sort the list, and 'exit to leave end the program."
      input = gets.strip
      puts
    end
  end

  def print_welcome_message
    puts "\nWelcome to the Stock Checker!\n\n"
  end

  def fill_stock_list
    @stock_list = StockScraper.scrape_stocks  
  end

  def display_stock_list
    puts "Today's trending stocks, powered by Yahoo! Finance:\n\n".bold
    @stock_list.each_with_index do |stock, index|
      print "#{index + 1}. "
      stock.display_key_info
    end
  end

  def handle_detail_display(input)
    if input.to_i < 1 || input.to_i > 30
      puts "Invalid number input. Enter a new command\n"
    else
      @stock_list[input.to_i - 1].display_more_info
    end
  end

end