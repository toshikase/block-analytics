require 'net/http'
require 'uri'
require 'json'

uri = URI.parse('https://blockchain.info/ja/rawaddr/13KyXfddwDibYKXE68zpKAfWqoTiw5TnEm')
json = Net::HTTP.get(uri)
result = JSON.parse(json)
puts result
