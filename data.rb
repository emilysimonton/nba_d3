require 'nokogiri'
require 'open-uri'
require 'pry'

def salary
  x = 1
  container = []
  while x <= 15
    url = "http://espn.go.com/nba/salaries/_/page/#{x}"
    page = Nokogiri::HTML(open(url))
    page.search('//tr').each do |cell|
      container.push(cell.content)
    end
    x+=1
  end
  container.each do |el|
    puts el
  end
end

# file = File.new("nba_salaries.csv", "w+")
# file.write(salary)
#salary

def player_stats
  urls = [
    "http://espn.go.com/nba/team/roster/_/name/atl/atlanta-hawks",
    "http://espn.go.com/nba/team/roster/_/name/bos/boston-celtics",
    "http://espn.go.com/nba/team/roster/_/name/bkn/brooklyn-nets",
    "http://espn.go.com/nba/team/roster/_/name/cha/charlotte-hornets",
    "http://espn.go.com/nba/team/roster/_/name/chi/chicago-bulls",
    "http://espn.go.com/nba/team/roster/_/name/cle/cleveland-cavaliers",
    "http://espn.go.com/nba/team/roster/_/name/dal/dallas-mavericks",
    "http://espn.go.com/nba/team/roster/_/name/den/denver-nuggets",
    "http://espn.go.com/nba/team/roster/_/name/det/detroit-pistons",
    "http://espn.go.com/nba/team/roster/_/name/gs/golden-state-warriors",
    "http://espn.go.com/nba/team/roster/_/name/hou/houston-rockets",
    "http://espn.go.com/nba/team/roster/_/name/ind/indiana-pacers",
    "http://espn.go.com/nba/team/roster/_/name/lac/los-angeles-clippers",
    "http://espn.go.com/nba/team/roster/_/name/lal/los-angeles-lakers",
    "http://espn.go.com/nba/team/roster/_/name/mem/memphis-grizzlies",
    "http://espn.go.com/nba/team/roster/_/name/mia/miami-heat",
    "http://espn.go.com/nba/team/roster/_/name/mil/milwaukee-bucks",
    "http://espn.go.com/nba/team/roster/_/name/min/minnesota-timberwolves",
    "http://espn.go.com/nba/team/roster/_/name/no/new-orleans-pelicans",
    "http://espn.go.com/nba/team/roster/_/name/ny/new-york-knicks",
    "http://espn.go.com/nba/team/roster/_/name/okc/oklahoma-city-thunder",
    "http://espn.go.com/nba/team/roster/_/name/orl/orlando-magic",
    "http://espn.go.com/nba/team/roster/_/name/phi/philadelphia-76ers",
    "http://espn.go.com/nba/team/roster/_/name/phx/phoenix-suns",
    "http://espn.go.com/nba/team/roster/_/name/por/portland-trail-blazers",
    "http://espn.go.com/nba/team/roster/_/name/sac/sacramento-kings",
    "http://espn.go.com/nba/team/roster/_/name/sa/san-antonio-spurs",
    "http://espn.go.com/nba/team/roster/_/name/tor/toronto-raptors",
    "http://espn.go.com/nba/team/roster/_/name/utah/utah-jazz",
    "http://espn.go.com/nba/team/roster/_/name/wsh/washington-wizards"
  ]
  urls.each do |u|
    url = u
    page = Nokogiri::HTML(open(url))
    page.search('//tr').each do |row|
      row.search('td').each do |cell|
        #binding.pry
        print '@',cell.text
      end
      print "\n"
    end
  end
end

#player_stats

def hollinger_stats
  x = 1
  while x <= 10
    url = "http://insider.espn.go.com/nba/hollinger/statistics/_/page/#{x}/qualified/false"
    page = Nokogiri::HTML(open(url))
    page.search('//tr').each do |row|
      row.search('td').each do |cell|
        print '@',cell.text
      end
      print "\n"
    end
    x+=1
  end
end

hollinger_stats
