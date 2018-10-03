require 'nokogiri'
require 'open-uri'

parse_product = Proc.new do |product_info|
	product = Hash.new
	# Monitors
	product[:monitors] = product_info.css('h2').text.to_i
	# Thin block info
	thin_info = product_info.css('dl.thin > dd')
	# Thin info - check_rate
	product[:check_rate] = thin_info[0].text.match(/\d+/)[0].to_i
	# Thin info - history
	product[:history] = thin_info[1].text.match(/\d+/)[0].to_i
	# Thin info - multiple_notifications
	product[:multiple_notifications] = thin_info[2].css('span').attr('class').text.include? 'success'
	# Thin info - push_notifications
	product[:push_notifications] = thin_info[3].css('span').attr('class').text.include? 'success'
	# Price
	product[:price] = /\d+\.\d+/.match(product_info.css('.btn').text)[0].to_f
	product
end

url = 'https://www.port-monitor.com/plans-and-pricing'

document = Nokogiri::HTML(open(url))

products = document.css('.product')
final_list = products.map(&parse_product)

puts final_list
