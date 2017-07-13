class StockChecker::CLI

  def call 
    print_welcome_message

    scrape_stocks

    display_stock_list

    menu
  end

  def menu
    puts "\nWhat would you like to do?".bold
    puts "Enter the list number of a given stock for more info., 'sort' to sort the list, 
          'display' to display the current list and 'exit to leave end the program.\n"

    input = gets.strip
    puts

    while input != "exit"
      if input.to_i.to_s == input # Checks if the input is an integer
        handle_detail_display(input)
      elsif input == "display"
        display_stock_list
      elsif input == "sort"
        handle_sort
      else
        puts "Invalid input. Try again.\n".bold
      end
      puts "\nWhat would you like to do?".bold
      puts "Enter the list number of a given stock for more info., 'sort' to sort the list, and 'exit to leave end the program."
      input = gets.strip
      puts
    end
  end

  def print_welcome_message
    puts "\nWelcome to the Stock Checker!\n".bold.blue
    puts "Loading trending stocks data...\n\n"
  end

  def scrape_stocks
    StockScraper.scrape_stocks  
  end

  def display_stock_list
    puts "Today's trending stocks, powered by Yahoo! Finance:\n\n".bold
    Stock.all.each_with_index do |stock, index|
      print "#{index + 1}. "
      stock.display_key_info
    end
  end

  def handle_detail_display(input)
    if input.to_i < 1 || input.to_i > 30
      puts "Invalid number input. Enter a new command\n"
    else
      Stock.all[input.to_i - 1].display_more_info
    end
  end

  def handle_sort
    puts "How would you like to sort your list?".bold
    puts "By 'default', 'alphabetical', 'price', 'change', or 'percent change'?"
    input = gets.strip
    puts

    if input =="default"
      Stock.sort_by_yahoo_default
      display_stock_list
    elsif input == "alphabetical"
      Stock.sort_by_alphabetical
      display_stock_list
    elsif input == "price"
      Stock.sort_by_price
      display_stock_list
    elsif input == "change"
      Stock.sort_by_change
      display_stock_list
    elsif input == "percent change"
      Stock.sort_by_percent_change
      display_stock_list
    else
      puts "Invalid sort option. Returning to main menu.\n".bold
    end
  end

end