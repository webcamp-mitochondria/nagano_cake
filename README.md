# NaganoCake

長野県にある小さな洋菓子店「ながのCAKE」の商品を通販するためのECサイト開発。  
このECサイトはDMM WEBCAMP生によるチーム開発課題となっております。実在するお店のサイトではありません。
 
# DEMO

![スクリーンショット 2023-09-26 140451](https://github.com/webcamp-mitochondria/nagano_cake/assets/138319041/91c97f48-4b26-4ee9-a17c-6e8697af5768)
 
# Features
 
ヘッダーの検索窓から商品名を検索することができます。  
サイドバーのジャンルをクリックすることでジャンルごとの商品一覧を閲覧することができます。  
顧客側の注文一覧の使命をクリックすることで顧客ごとの注文履歴を閲覧することができます。
 
# Requirement
 
* devise
* kaminari 1.2.1
* bootstrap5-kaminari-views 0.0.1
* enum_help
 
# Installation
 
```bash
bundle install
rails g devise:install
rails g kaminari:config

```
 
# Usage
 
```bash
git clone git@github.com:webcamp-mitochondria/nagano_cake.git
cd nagano_cake
rails db:migrate
rails db:seed
bundle install
yarn install
yarn add @babel/plugin-proposal-private-methods @babel/plugin-proposal-private-property-in-object
rails s
```
 
# Note
 
管理者側のログインページに遷移するためにはURLの後ろに"/admin/sign_in"と入力する必要があります。  
管理者のメールアドレス・パスワードは以下の通りです。dbのseeds.rbでも確認可能です。  

* email: 'admin@nagano.com'
* password: 'admin_pass'

# Author
 
* つるりん
* こうじ
* だてちゃん
* みやべっち
