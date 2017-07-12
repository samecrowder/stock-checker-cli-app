class StockScraper

	# As I currently have it, initialize method must return array of Stock objects that have just been scraped
	attr_accessor :stock_list

	def initialize
		scrape_stocks
	end

	def scrape_stocks
		doc = Nokogiri::HTML(open('https://www.nyse.com/listings_directory/index'))
		whole_table_body = doc.css('tbody')
		binding.pry
		@stock_list = ["stock 1", "stock 2", "stock 3"]
	end
end