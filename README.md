# README

## users テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false                    |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |
| lastname_kanji     | string     | null: false                    |
| firstname_kanji    | string     | null: false                    |
| lastname_kana      | string     | null: false                    |
| firstname_kana     | string     | null: false                    |
| birth              | date       | null: false                    |

### Association

- has_many :item_purchases
- has_many :items

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| postage_type_id    | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| preparation_day_id | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :item_purchase
- belongs_to_active_hash :category_id
- belongs_to_active_hash :status_id
- belongs_to_active_hash :postage_type_id
- belongs_to_active_hash :prefecture_id
- belongs_to_active_hash :preparation_day_id

## item_purchases テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :purchase


## purchases テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| prefecture_id      | integer    | null: false, foreign_key: true |
| city               | string     | null: false                    |
| block              | string     | null: false                    |
| building_name      | string     |                                |
| tel                | string     | null: false                    |
| item_purchase      | references | null: false, foreign_key: true |


### Association

- belongs_to_active_hash :prefecture_id
- belongs_to :item_purchase

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