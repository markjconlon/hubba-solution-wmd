require 'nokogiri'
require 'csv'

file = File.open('start.html')
html = Nokogiri::HTML(file)

products = []
CSV.foreach("productInformation.csv", headers: true) do |row|
  products << row
end
