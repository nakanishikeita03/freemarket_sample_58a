# freemarket-sample-58a

プログラミングスクールTECH::EXPERTの最終課題で某フリーマーケットサービスのクローンサイトを作成しました。約1ヶ月間、４人チームでアジャイル開発を行いました。

# リンク

https://freemarket-sample-58a.com/

Basic認証をかけています。ご覧の際は以下のIDとPassを入力してください。
- Basic認証
  - ID: admin
  - Pass: 5a8a

# テストユーザー

- 購入者用アカウント
  - メールアドレス: buyer@buyer.com
  - パスワード: buyer123 

- 購入用カード情報
  - 番号：4242424242424242
  - 期限：12/20
  - セキュリティコード：123

- 出品用アカウント
  - メールアドレス名: seller@seller.com
  - パスワード: seller123


# nakanishikeita03の担当箇所

## ユーザー

### ユーザー新規登録機能

![メルカリユーザー mov](https://user-images.githubusercontent.com/53807858/67619691-5c7c8700-f839-11e9-92a7-b9c317cd9eb4.gif)

- sessionを用いて複数のページの変遷可能な実装をしました。

```
def step2
      session[:nickname] = params[:user][:nickname]
```

### SNSアカウントでのログイン機能

![メルカリsns認証 mov](https://user-images.githubusercontent.com/53807858/67620273-0b23c600-f840-11e9-9d34-91effcafefdf.gif)

- gem omniauthを用いて外部APIからユーザー情報を取得しました。

- SNS認証の場合はgem deviseの機能を用いてパスワードを自動生成するようにしました。

```
  def create
    if session[:provider].present? && session[:uid].present?
      password = Devise.friendly_token.first(7)
```

### ユーザーログアウト機能

### ユーザー編集機能


## 商品出品

### 商品新規出品機能

![メルカリ商品出品 mov](https://user-images.githubusercontent.com/53807858/67621894-424da380-f84f-11e9-8749-e4d14e15d1bd.gif)

- 商品情報を保存する**Productテーブル**と写真を保存する**Imageテーブル**のレコードを1ページで作成するように実装しました。
  accepts_nested_attributes_forをmodelで定義し、1つのformで値を送れるように実装しました。

```
= form_for @product do |f|
      ~省略〜
  = f.fields_for :image do |image|
    = image.label :image, for: "upload-image__btn" do
        = image.file_field :image, type: "file", name: "product[images_attributes][0][image]"
```

- jQueryを用いて、登録した写真のプレビューを見れるように実装しました。
  また写真の削除を[非同期での通信](https://github.com/nakanishikeita03/freemarket_sample_58a/blob/master/app/assets/javascripts/sell.js)で可能にしました。

![メルカリ商品出品画像 mov](https://user-images.githubusercontent.com/53807858/67622556-213c8100-f856-11e9-9dd9-a4efed4b496b.gif)

### 商品編集機能
### 商品削除機能
### トップページ(products#index)のビュー作成


## コメント

### コメント投稿機能

![メルカリコメント投稿 mov](https://user-images.githubusercontent.com/53807858/67623073-05d47480-f85c-11e9-9ff6-038ef064291c.gif)

### コメント削除機能
### コメントビュー作成

## 検索

### あいまい検索

![メルカリあいまい検索 mov](https://user-images.githubusercontent.com/53807858/67623676-1dfbc200-f863-11e9-998a-63988149b5df.gif)

- LIKE句を用いて、Productテーブルのnameカラムと入力した値が合致したレコードを取得できるように実装しました。

```
  def self.search(search)
    return Product.all unless search
    Product.where(['name LIKE ?', "%#{search}%"])
  end
```

### 詳細検索

![詳細検索 mov](https://user-images.githubusercontent.com/53807858/67623680-2bb14780-f863-11e9-9476-a36178292307.gif)

- gem ransackを用いて、それぞれのカラムに入力した値と合致するレコードを取得できるように実装しました。
  また価格順/出品順に並び替えることもできます。

### 検索ビューページ

## その他

### DB設計

![メルカリER図 (1)](https://user-images.githubusercontent.com/53807858/67630498-01e03b00-f8cc-11e9-8197-c37aba2f4a82.png)


### ドメイン取得/SSLサーバー証明書の取得

  - Certificate ManagerでSSLサーバ証明書を発行し、お名前.comで取得したドメインをRoute53/ELBで常時SSL化しています。

### 各種バリデーション

  - 正規表現を用いて形式に当てはまらない値は保存できないようにしました。

  ```
  kanji = /\A[一-龥]+\z/
  kana = /\A([ァ-ン]|ー)+\z/
  year_month_day = /\A\d{4}-\d{2}-\d{2}\z/

  validates :f_name_kanji, presence: true, length: { maximum: 15 }, format: { with: kanji }
  validates :f_name_kana, presence: true, length: { maximum: 15 }, format: { with: kana }
  validates :birthday, presence: true, format: { with: year_month_day }
  ```

  - gem Antivirusを用いて不適切なワードは登録できないようにしました。

  ![メルカリantivirus mov](https://user-images.githubusercontent.com/53807858/67630727-96986800-f8cf-11e9-92e3-9adea4fc05df.gif)

### 単体テスト/統合テスト(RSpec)

### スクラムマスター
  - ウィークリースクラム、デイリースクラムを立てアジャイル開発をしました。

# 使用技術一覧

- Ruby 2.5.1
- Ruby on Rails 5.2.3
- MySQL 5.6.43
- Haml 5.1.2
- Sass 3.7.4
- jQuery 3.4.1
- Rspec 3.9
- AWS
  - EC2
  - ELB
  - S3
  - Route53
  - Certificate Manager
- Github