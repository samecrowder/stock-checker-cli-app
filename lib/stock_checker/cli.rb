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

    input = gets.strip

    while input != "exit"
      if input.to_i.to_s == input # Checks if the input is an integer
        @stock_list[input.to_i - 1].display_more_info
      elsif input == "sort"
        puts "SORTING LIST"
      end
      input = gets.strip
    end
  end

  def print_welcome_message
    puts "\nWelcome to the Stock Checker!\n\n"
  end

  def fill_stock_list
    @stock_list = StockScraper.scrape_stocks  
  end

  def display_stock_list
    puts "Today's trending stocks, powered by Yahoo! Finance:\n\n"
    @stock_list.each_with_index do |stock, index|
      print "#{index + 1}. "
      stock.display_key_info
    end
  end

end