class StockChecker::CLI

  def call 
    @stock_list = []

    print_welcome_message
    fill_stock_list
    display_stock_list
  end

  def print_welcome_message
    puts "\nWelcome to the Stock Checker!\n\n"
  end

  def fill_stock_list
    @stock_list = StockScraper.scrape_stocks  
  end

  def display_stock_list
    puts "Today's trending stocks, powered by Yahoo! Finance:"
    @stock_list.each_with_index do |stock, index|
      print "#{index + 1}. "
      stock.display_key_info
    end
  end

end