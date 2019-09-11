
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
- has_many :images dependent: :destroy


## imagesテーブル
|Column|Type|Options|
|---|---|---|
|product_id|reference|null:false,foreign_key:true|
|image|string|null: false|

### Association
- belongs to product 



## usersテーブル
|Column|Type|Options|
|---|---|---|
|nickname|string|null: false,limit: 15, default: ""|
|e_mail|string|null:false,unique: true|
|password|string|null: false|
|f_name_kana|string|null: false,limit: 15, default: ""|
|l_name_kana|string|null: false,limit: 15, default: ""|
|f_name_kanji|string|null: false,limit: 15, default: ""|
|l_name_kanji|string|null: false,limit: 15, default: ""|
|birthday|integer|null: false|




### Association
- has_many :products 
- has_one :address dependent: :destroy
- has_one :credit_card dependent: :destroy
- has_one :has_many_sns_credentials dependent: :destroy

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