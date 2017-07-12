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

  PRICE_DISPLAY_NUM_SPACES_BEFORE = 45

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
    print "#{self.symbol}," 
    print "#{self.company}#{" "*(PRICE_DISPLAY_NUM_SPACES_BEFORE - (self.symbol.length + self.company.length))}"
    print "Price: #{self.last_price}, " 
    print "Today's Change: #{self.change}"
  end
end