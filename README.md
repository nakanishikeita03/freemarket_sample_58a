
# README

## productsテーブル
|Column|Type|Options|
|---|---|---|
|user_id|reference|null:false,foreign_key:true|
|name|string|null: false|
|detail|text|null: false|
|category|integer|null: false,default 0|
|price|integer|null: false|
|status|integer|null:false,default 0|
|state|integer|null: false,default 0|
|city|integer|null: false|
|delivery|integer|null: false|


### Association
- belongs to user
- belongs to image


## imagesテーブル
|Column|Type|Options|
|---|---|---|
|product_id|reference|null:false,foreign_key:true|
|main_image|string|null: false|
|sub1_image|string||
|sub2_image|string||
|sub3_image|string||

### Association
- belongs to product



## usersテーブル
|Column|Type|Options|
|---|---|---|
|f_name_kana|string|null: false|
|l_name_kana|string|null: false|
|f_name_kanji|string|null: false|
|l_name_kanji|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
|nickname|string|null: false|
|password|string|null: false|
|e_mail|string|null:false,unique: true|
|telephone|integer|null: false,unique: true|

### Association
- has_many :products
- belongs to addresse
- belongs to credit_card


## addressesテーブル
|Column|Type|Options|
|---|---|---|
|postal_code|integer|null: false|
|region|string|null: false|
|city|string|null: false|
|building|string|
|user_id|references|null: false, foreign_key: true|

##Association
- belongs_to :user​​


## credit_cardsテーブル
|Column|Type|Options|
|---|---|---|
|user_id|integer|null:false,foreign_key:true|
|numbar|integer|null:false|
|year|integer|null:false|
|month|integer|null:false|
|CVC|integer|null:false|

##Association
- belongs_to :user​​


## has_many_sns_credentialsテーブル
|Column|Type|Options|
|---|---|---|
|user_id|integer|null:false,foreign_key:true|
|uid|integer|null:false,unique: true|
|provider|integer|null:false|

##Association
- belongs_to :user​​