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

# tasksmemo DB設計図
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|nickname|string|null: false|

## Association
- has_many :memos


## memosテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|content|text|
|user_id|references|foreign_key: true|

## Association
- belongs_to :user

https://gyazo.com/bbd0d1f86717b4746589ecff5694c248