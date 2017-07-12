class StockScraper

  # As I currently have it, initialize method must return array of Stock objects that have just been scraped
  attr_accessor :stock_list

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

  NUM_DATA_PIECES_PER_STOCK = 12


  def initialize
    @stock_list = []
    scrape_stocks
  end

  def scrape_stocks
    page = open('https://finance.yahoo.com/trending-tickers')
    sleep 3  # Give page time to fully load before parsing
    doc = Nokogiri::HTML(page)
    stock_nodes = doc.css('[class^="data-row"]')

    stock_nodes.each_with_index do |stock_node|
      stock = Stock.new

      NUM_DATA_PIECES_PER_STOCK.times do |index|
        data_node = stock_node.css(".data-col#{index}")
        assign_stock_attribute(stock, data_node, index)
      end
      @stock_list << stock
    end
    @stock_list
  end

  # This method is passed a Stock object, the data node holding the next piece of information
  # and the index/column location of the iteration through the current stock and assigns the
  # information from the data node to the corresponding attribute of the Stock object.
  def assign_stock_attribute(stock, data_node, col_location)
    case col_location
    when COL_LOCATION_SYMBOl
      stock.symbol = data_node.text
    when COL_LOCATION_COMPANY
      stock.company = data_node.text
    when COL_LOCATION_LAST_PRICE
      stock.last_price = data_node.text
    when COL_LOCATION_MARKET_TIME
      stock.market_time = data_node.text
    when COL_LOCATION_CHANGE
      stock.change = data_node.text
    when COL_LOCATION_PERCENT_CHANGE
      stock.percent_change = data_node.text
    when COL_LOCATION_VOLUME
      stock.volume = data_node.text
    when COL_LOCATION_AVG_VOLUME_3_MONTH
      stock.avg_volume_3_month = data_node.text
    when COL_LOCATION_MARKET_CAP
      stock.market_cap = data_node.text
    when COL_LOCATION_INTRADAY_HIGH_LOW
    when COL_LOCATION_YEAR_RANGE
    when COL_LOCATION_DAY_CHART
      # Skip these three due the the value within the <td> being an html <canvas> tag.
      # Do nothing here
    end         
  end
end