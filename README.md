# README

# アクセス
Elastic IPアドレス: 13.113.231.198　(※ぐるなびWebAPIサービス停止により検索機能停止中)

# アプリ名　decideYourPlan
行きたいメインスポットを選んで、条件を入力するとその日のデートプランを立ててくれるアプリです。  
ぐるなびAPIとgoogleAPIを使用し、自動で食事の場所と各行き先までの所要時間を提示します。  
気に入ったプランを投稿・保存することができます。

# 開発環境
使用言語  Ruby 2.5.1  
開発フレームワーク Rails 5.2.4.1

# アプリの使い方
＜メインのプランを立てる機能＞  
1.メインの行き先を選ぶ→topページから検索窓を使用orプルダウンメニューを使用or下部の一覧から「ここに行く」を選択。  
2.日時などの条件を入力。  
3.デートプランが表示される。ぐるなびのリンクでレストランの詳細が見れます。レストランでクーボンなども使用して下さい。  
  
＜プランを投稿する機能＞  
1.プラン表示画面の下部にコメントを記入(任意)し、「このプランを投稿する」ボタンで投稿・保存できます  
  
＜すでに投稿されたプランを利用する機能＞  
1.トップページの「投稿プラン一覧」から投稿されたプランの一覧を見ることができます。  
2.「このプランの詳細」ボタンからプランの詳細が見れます。  
3.プラン詳細画面で出発地と日付を入力し、「このプランを利用する」ボタンを押すと同じプランを利用することができます。


# Authors
Daisuke Ishikawa

# References
ぐるなび  [https://www.gnavi.co.jp/](https://www.gnavi.co.jp/)

googleAPI  [https://console.cloud.google.com/apis/library?hl=ja&project=logical-handler-266206&folder&organizationId](https://console.cloud.google.com/apis/library?hl=ja&project=logical-handler-266206&folder&organizationId)



# decideYourPlan DB設計
## placesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|
|address|string|
|link|string|
|image|text|
|prefecture|string|
|description|text|

### Association
- belongs_to :subplace


## searchesテーブル
|Column|Type|Options|
|------|----|-------|
|lunch_name|string|
|lunch_text|text|
|lunch_image|text|
|lunch_address|string|
|lunch_link|string|
|dinner_name|string|
|dinner_text|text|
|dinner_image|text|
|dinner_address|string|
|dinner_link|string|
|section1|integer|
|section2|integer|
|section3|integer|
|section4|integer|
|plan_comment|text|
|went_date|string|
|place_id|integer|
|subplace_id|integer|
|user_id|integer|

### Association
- belongs_to :place
- belongs_to :subplace
- belongs_to :user


## subplacesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|
|place_id|integer|
|address|string|
|link|string|
|image|text|
|prefecture|string|
|description|text|

### Association
- has_many :places


## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|nickname|string|null: false|

### Association
- has_many :searches

