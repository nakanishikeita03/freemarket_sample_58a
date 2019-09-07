# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## usersテーブル
|Column|Type|Options|
|name-kana|string|null: false|
|name-kanji|string|null: false|
|birthday|integer|null: false|
|nickname|string|null: false|
|password|string|null: false|
|address|string|null: false|
|telephone|integer|null: false|
|credit-card|integer|null: false|

### Association
- has_many :products
- has_many :messages
- has_many :comments
- has_many :followers, through: :users_followers
- has_many: users_followers

## followersテーブル
|Column|Type|Options|
|user_id|integer|null: false|

### Association
- has_many :users_followers
- has_many :users, through: :users_followers

## users_followersテーブル
|Column|Type|Options|
|user|references|null: false, foreign_key: true|
|follower|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :follower

## productsテーブル
|Column|Type|Options|
|name|string|null: false|
|detail|text|null: false|
|category|string|null: false|
|price|integer|null: false|
|state|string|null: false|
|delivery|string|null: false|
|like|integer|

### Association
- belongs to user
- has many comments
- has many messages

## imagesテーブル
|Column|Type|Options|
|id|integer|null: false|
|url|text|null: false|

### Association
- belongs to product

## commentsテーブル
|Column|Type|Options|
|id|integer|foreign_key: true|
|content|text|null: false|
|user_id|integer|null: false|foreign_key: true|
|product_id|integer|null: false|foreign_key: true|

### Association
- belongs to :user
- belongs to :product

## messagesテーブル
|Column|Type|Options|
|id|integer|foreign_key: true|
|user_id|references|
|product_id|
|content|text|

### Association
- belongs to :user
- belongs to :product