class StockScraper

  # As I currently have it, initialize method must return array of Stock objects that have just been scraped
  attr_accessor :stock_list

  NUM_DATA_PIECES_PER_STOCK = 12


  # def initialize
  #   @stock_list = []
  #   scrape_stocks
  # end

  def self.scrape_stocks
    stock_list = []

    page = open('https://finance.yahoo.com/trending-tickers')
    sleep 3  # Give page time to fully load before parsing
    doc = Nokogiri::HTML(page)
    stock_nodes = doc.css('[class^="data-row"]')

    stock_nodes.each_with_index do |stock_node|
      stock = Stock.new

      NUM_DATA_PIECES_PER_STOCK.times do |index|
        data_node = stock_node.css(".data-col#{index}")
        stock.assign_stock_attribute_from_scraper(data_node, index)
      end
      stock_list << stock
    end
    stock_list
  end

end