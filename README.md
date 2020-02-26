# README


# decideYourPlan
行きたいメインスポットを選んで、条件を入力するとその日のデートプランを立ててくれるアプリです。

# Dependency
使用言語  Ruby 2.5.1

# Usage
1.メインの行き先を選ぶ→topページから検索窓を使用orプルダウンメニューを使用or一覧から「ここに行く」を選択。

2.日時などの条件を入力。

3.デートプランが表示される。ぐるなびのリンクでレストランの詳細が見れます。クーボンなども使用して下さい。

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
- has_many :subplaces


## postsテーブル
|Column|Type|Options|
|------|----|-------|
|place|string|null: false|
|content|text|
|user_id|integer|null: false|
### Association
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
- belongs_to :place


## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|nickname|string|null: false|

### Association
- has_many :posts

