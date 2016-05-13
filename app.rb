require 'sinatra'
require 'sinatra/reloader'
require 'sass'
require 'net/http'
require 'uri'
require 'json'

# Model用
require_relative 'models/analyze'

get '/' do
  erb :index
end

# 分析ボタンをおした時の動作
post '/analyze' do
  @address = params[:address]

  # JSON取得
  uri = URI.parse("https://blockchain.info/ja/rawaddr/#{@address}")
  json = Net::HTTP.get(uri)
  @result = JSON.parse(json)
 
  # TODO:Analyze class のメソッドを呼び出して配列を返してもらう
  #risks = Analyze.new
  #risks.{メソッド名}

  # 本来は上記のメソッドを呼び出すことによりrisk配列に数値が格納される。
  # TODO:なので下記の配列は実際は削除する
  risks = Array[20, 10, 30, 40, 5, 0, 1, 30, 1]


  # MEMO:下記は一つづつ配列に入れなくてもrisksをそのままviewに持っていける
  # から時間があれば修正
  @total_risk = risks[0]
  @param1 = risks[1]
  @param2 = risks[2]
  @param3 = risks[3]
  @param4 = risks[4]
  @param5 = risks[5]
  @param6 = risks[6]
  @param7 = risks[7]
  @param8 = risks[8]

  # analyze.erbを生成する
  erb :analyze
end
