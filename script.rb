require 'nokogiri'
require 'csv'

file = File.open('start.html')
html = Nokogiri::HTML(file)

products = []
CSV.foreach("productInformation.csv", headers: true) do |row|
  products << row
end

product_table = html.at_css("table#products")

products.each_with_index do |val,index|
  product_table.add_child "<tr><td style='width:200px'><img src='#{products[index]["image"]}' width='100%'></td><td style='width:280px; padding-left:20px'><p style='margin:0; min-height: 179px; max-height: 179px; overflow: auto; font-style: oblique; color: rgb(104,112,100); font-weight: 100; line-height: 19px;'>#{products[index]["Company Name"]} - #{products[index]["Product Name"]}<br/><br/>#{products[index]["Product Description"]}</p><p><span style='font-weight:500'>MRSP: #{products[index]["MSPR"]}</span> <a href='http://www.hubba.com' style='color:black'><button style='width: 80px; height:25px; background-color: white; border: 1px solid rgb(133,154,173); border-radius: 12.5px; padding: 0; color: inherit; font-size: 11px; margin-left: 32px;'>Order</button></a></p></td></tr>"
  product_table.add_child "<tr style='height:30px'></tr>"
end

File.write("end.html", html.to_html)
