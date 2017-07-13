class StockScraper

  # As I currently have it, initialize method must return array of Stock objects that have just been scraped
  attr_accessor :stock_list

  NUM_DATA_PIECES_PER_STOCK = 12

  def self.scrape_stocks
    stock_list = []

    # Open Yahoo! Finance page and store info into array of Nokogiri nodes
    page = open('https://finance.yahoo.com/trending-tickers')
    sleep 3  # Give page time to fully load before parsing
    doc = Nokogiri::HTML(page)
    stock_nodes = doc.css('[class^="data-row"]')

    # Iterate through each stock node
    stock_nodes.each_with_index do |stock_node, row_index|
      stock = Stock.new
      stock.row_number = row_index + 1 # 1 is added here because row_index is the array index 
                                       # and stock.row_number begins at 1 and goes in list order

      # Iterate the 'however many pieces of data each stock has' times and give the stocks their attributes
      NUM_DATA_PIECES_PER_STOCK.times do |index|
        data_node = stock_node.css(".data-col#{index}")
        stock.assign_stock_attribute_from_scraper(data_node, index)
      end
      stock_list << stock
    end
    stock_list
  end

end