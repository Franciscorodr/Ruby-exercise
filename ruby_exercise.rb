require 'nokogiri'
require 'open-uri'

parseProduct = Proc.new { |productInfo|
	product = Hash.new
	# Monitors
	product['monitors'] = productInfo.css('h2').text.to_i
	# Thin block info
	thinInfo = productInfo.css('dl.thin > dd')
	# Thin info - check_rate
	product['check_rate'] = thinInfo[0].text.match(/\d+/)[0].to_i
	# Thin info - history
	product['history'] = thinInfo[1].text.match(/\d+/)[0].to_i
	# Thin info - multiple_notifications
	product['multiple_notifications'] = thinInfo[2].css('span').attr('class').text.include? 'success'
	# Thin info - push_notifications
	product['push_notifications'] = thinInfo[3].css('span').attr('class').text.include? 'success'
	# Price
	product['price'] = /\d+\.\d+/.match(productInfo.css('.btn').text)[0].to_f
	product
}

url = 'https://www.port-monitor.com/plans-and-pricing'

document = Nokogiri::HTML(open(url))

products = document.css('.product')
finalList = products.map(&parseProduct)

puts finalList