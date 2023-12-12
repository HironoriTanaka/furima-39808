# README

## users テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user_id            | references | null: false, foreign_key: true |
| nickname           | string     | null: false                    |
| mail_address       | string     | null: false                    |
| password           | string     | null: false                    |
| lastname_kanji     | string     | null: false                    |
| firstname_kanji    | string     | null: false                    |
| lastname_kana      | string     | null: false                    |
| firstname_kana     | string     | null: false                    |
| birthdate_year     | string     | null: false                    |
| birthdate_month    | string     | null: false                    |
| birthdate_date     | string     | null: false                    |

### Association

- has_many :item_id
- has_many :purchase_id
- has_many :delivery_id

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_id            | references | null: false, foreign_key: true |
| item_image         | string     | null: false                    |
| item_name          | string     | null: false                    |
| item_description   | string     | null: false                    |
| item_category      | string     | null: false                    |
| item_status        | string     | null: false                    |
| delivery_charge    | string     | null: false                    |
| item_count         | string     | null: false                    |

### Association

- belongs_to :user_id

## purchase テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| purchase_id        | references | null: false, foreign_key: true |
| purchase_count     | string     | null: false                    |

### Association

- belongs_to :user_id
- belongs_to :item_id

## delivery テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| delivery_id        | references | null: false, foreign_key: true |
| postal_code        | string     | null: false                    |
| prefectures        | string     | null: false                    |
| city               | string     | null: false                    |
| block              | string     | null: false                    |
| building_name      | string     | null: false                    |
| tel                | string     | null: false                    |

### Association

- belongs_to :user_id
- belongs_to :item_id

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
