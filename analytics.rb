# 参考 http://mironal-memo.blogspot.jp/2012/07/mongodb-ruby.html
require 'bundler/setup' #カレントディレクトリのGemを呼び出す用
require 'mongo'
require 'net/http'
require 'uri'
require 'json'

# addressを50個配列にする

accounts = Array['13KyXfddwDibYKXE68zpKAfWqoTiw5TnEm', '13KyXfddwDibYKXE68zpKAfWqoTiw5TnEm']

accounts.each do |account|
  # JSON取得
  uri = URI.parse("https://blockchain.info/ja/rawaddr/#{account}")
  json = Net::HTTP.get(uri)
  result = JSON.parse(json)

  # Mongoに格納
  connection = Mongo::Client.new([ 'localhost:27017' ], :database => 'analytics')
  result = connection[:logs].insert_many([result])
end
