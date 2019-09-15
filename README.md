
# README

## productsテーブル
|Column|Type|Options|
|---|---|---|
|user_id|references|null:false,foreign_key:true|
|name|string|null: false|
|detail|text|null: false|
|category|references|null: false|   現在はinteger型にしてます
|price|integer|null: false|
|status|integer|null:false,default 0|
|state|integer|null: false,default 0|
|city|references|null: false|       現在はinteger型にしてます
|delivery|integer|null: false|
|fee_payer|integer|null: false|
|delivery_time|integer|null: false|


### Association
- belongs to user
- has_many :images dependent: :destroy


## imagesテーブル
|Column|Type|Options|
|---|---|---|
|product_id|references|null:false,foreign_key:true|
|image|string|null: false|

### Association
- belongs to product dependent: :destroy



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
|postal_code|integer|
|prefecture|integer|
|city|string|
|street|string|
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


## sns_credentialsテーブル
|Column|Type|Options|
|---|---|---|
|user_id|references|foreign_key:true|
|uid|integer|
|provider|integer|

##Association
- belongs_to :user​​