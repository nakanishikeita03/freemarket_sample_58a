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
<!-- - gem Antivirusを用いて不適切なワードは登録できないようにしました。 -->

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
