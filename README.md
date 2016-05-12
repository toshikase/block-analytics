最終的なアウトプット「アカウントIDを入れると、異常値X%というリスク評価ができるサービス」

## 起動
```
$ git clone https://github.com/toshikase/block-analytics.git
$ cd block-analytics
$ bundle init --path=vendor/bundle
$ bundle exec ruby app.rb
```
localhost:4567で起動

## 開発の進め方は下記
1. 複数Bitcoinアカウントをサンプルとして(まず50くらい)、過去の取引履歴を整理してDBにいれる(5/10)
2. 説明変数をいくつか設定して、説明変数の重み付けを行う(5/11)
3. モデルを組む(5/11)
4. ブラウザ用の枠組みつくる(5/12)
5. 3と4を合わせる(5/12)
6. サンプルを増やす(取り組み次第)

## もう少し具体的にしたTODO
i)   rubyでBlockchain.infoのAPIを叩いてサンプルアカウントデータを取得  
ii)  MongoにJSONのまま格納  
iii) JSONデータから必要と思われるKeyを選ぶ(10個以内くらい)  
iv)  50個のKey:valueを何かしらの分析ツールにつっこむ(知りたいのは標準偏差/分散?)  
v)   任意にKeyの重み付けを行う => モデルが完成  
iv)  SinatraかRailsかで1ページのアプリを作成  

## 1ページアプリの仕様イメージ
- 調査したいアカウントを入れるフォームを作る
- 「調査」ボタンを作る
- 「調査」ボタンを押すことで、次のページかそのページ内に各パラメータごとの異常値割合とトータルの異常値割合が出てくる

## Mongo接続の参考
https://docs.mongodb.com/ecosystem/tutorial/ruby-driver-tutorial-2-0/
