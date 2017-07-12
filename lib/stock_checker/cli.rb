class StockChecker::CLI

  def call 
    print_welcome_message
    print_stock_list
  end

  def print_welcome_message
    puts "\nWelcome to the Stock Checker!\n\n"
  end

  def print_stock_list
    puts "Today's hottest and coldest stocks:"

    stock_list = StockScraper.new.stock_list

    puts stock_list
    puts "\n"
  end

end