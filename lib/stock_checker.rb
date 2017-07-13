# This file acts as the environment file for the gem and uses require statements to bring
# files and dependencies together.

require_relative "./stock_checker/version"
require_relative "./stock_checker/cli"
require_relative "./stock_checker/stock_scraper"
require_relative "./stock_checker/stock"

require_relative "../colored/lib/colored"

require "nokogiri"
require "open-uri"

