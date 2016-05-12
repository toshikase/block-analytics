# 参考 http://mironal-memo.blogspot.jp/2012/07/mongodb-ruby.html
require 'bundler/setup' #カレントディレクトリのGemを呼び出す用
require 'mongo'

connection = Mongo::Client.new([ 'localhost:27017' ])
puts 'データベース一覧'
puts connection.database_names
