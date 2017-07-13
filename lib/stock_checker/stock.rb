class Stock

  COL_LOCATION_SYMBOl = 0
  COL_LOCATION_COMPANY = 1
  COL_LOCATION_LAST_PRICE = 2
  COL_LOCATION_MARKET_TIME = 3
  COL_LOCATION_CHANGE = 4
  COL_LOCATION_PERCENT_CHANGE = 5
  COL_LOCATION_VOLUME = 6
  COL_LOCATION_AVG_VOLUME_3_MONTH = 7
  COL_LOCATION_MARKET_CAP = 8
  COL_LOCATION_INTRADAY_HIGH_LOW = 9
  COL_LOCATION_YEAR_RANGE = 10
  COL_LOCATION_DAY_CHART = 11

  NUM_SPACES_BEFORE_PRICE_DISPLAY = 45
  NUM_SPACES_BEFORE_CHANGE_DISPLAY = 10
  NUM_SPACES_BEFORE_PERCENT_CHANGE_DISPLAY = 10


  attr_accessor :symbol, :company, :last_price, :market_time, :change, :percent_change, :volume, :avg_volume_3_month,
          :market_cap, :intraday_high_low, :year_range, :day_chart, :row_number

  # This method is passed a Stock object, the data node holding the next piece of information
  # and the index/column location of the iteration through the current stock and assigns the
  # information from the data node to the corresponding attribute of the Stock object.
  def assign_stock_attribute_from_scraper(data_node, col_location)
    case col_location
    when COL_LOCATION_SYMBOl
      self.symbol = data_node.text
    when COL_LOCATION_COMPANY
      self.company = data_node.text
    when COL_LOCATION_LAST_PRICE
      self.last_price = data_node.text
    when COL_LOCATION_MARKET_TIME
      self.market_time = data_node.text
    when COL_LOCATION_CHANGE
      self.change = data_node.text
    when COL_LOCATION_PERCENT_CHANGE
      self.percent_change = data_node.text
    when COL_LOCATION_VOLUME
      self.volume = data_node.text
    when COL_LOCATION_AVG_VOLUME_3_MONTH
      self.avg_volume_3_month = data_node.text
    when COL_LOCATION_MARKET_CAP
      self.market_cap = data_node.text
    when COL_LOCATION_INTRADAY_HIGH_LOW
    when COL_LOCATION_YEAR_RANGE
    when COL_LOCATION_DAY_CHART
      # Skip these three due the the value within the <td> being an html <canvas> tag.
      # Do nothing here
    end         
  end

  def display_key_info
    print "#{self.symbol}, " 
    print "#{self.company}"
    print "#{" "*(NUM_SPACES_BEFORE_PRICE_DISPLAY - (self.symbol.length + self.company.length))}"

    # Makes sure that single vs. double digit index numbers don't misalign other columns
    if self.row_number.to_s.size == 1
      print " "
    end

    print "Price: #{self.last_price}" 
    print "#{" "*(NUM_SPACES_BEFORE_CHANGE_DISPLAY - self.last_price.length)}"

    print "Change: #{self.change}"
    print "#{" "*(NUM_SPACES_BEFORE_PERCENT_CHANGE_DISPLAY - self.change.length)}"

    print "% Change: #{self.percent_change}"

    puts
  end

  def display_more_info
    puts "Your selected stock:\n".bold
    puts "Stock symbol: #{self.symbol}"
    puts "Company name: #{self.company}"
    puts "Last price: #{self.last_price}"
    puts "Market Time: #{self.market_time}"
    puts "Daily change: #{self.change}"
    puts "Daily percent change: #{self.percent_change}"
    puts "Volume: #{self.volume}"
    puts "Avg. 3 month volume: #{self.avg_volume_3_month}"
    puts "Market cap: #{self.market_cap}"
  end
end