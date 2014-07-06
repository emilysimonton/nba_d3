require 'nokogiri'
require 'open-uri'

def salary
  x = 1
  container = []
  while x <= 15
    url = "http://espn.go.com/nba/salaries/_/page/#{x}"
    page = Nokogiri::HTML(open(url))
    page.search('//td').each do |cell|
      container.push(cell.content)
    end
    x+=1
  end
  container.each_slice(4).to_a
end

file = File.new("nba_salaries.csv", "w+")
file.write(salary)


# salary
