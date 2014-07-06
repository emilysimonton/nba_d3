require 'nokogiri'
require 'open-uri'

def salary
  url = "http://espn.go.com/nba/salaries/_/page/1"
  page = Nokogiri::HTML(open(url))
  container = []
  page.search('//tr').each do |cell|
    container.push(cell.content)
  end
  p container
end

salary
