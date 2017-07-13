# Specifications for the CLI Assessment

Specs:
- [X] Have a CLI for interfacing with the application
	- My CLI first displays the list of 30 stocks scraped from Yahoo! Finance. The user then has the
	  option of entering a number to see more information about the stock and that location in the list,
	  entering 'sort' to see a small sub-menu of various ways that the list of stocks can be sorted and
	  re-displayed, or 'exit' at any time to quit the program.
- [X] Pull data from an external source
	- I've pulled a list of 30 'Trending Stocks' from 'https://finance.yahoo.com/trending-tickers'. The
	  information from each row on this page is used to create a Stock object and give it certain
	  attributes.
- [X] Implement both list and detail views
	- As described under the CLI requirement, my gem has the ability to display the entire list of 30
	  stocks in various sorted orders, or to view more details on a given stock.

