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

- has_many :purchase_ids,items

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| image              | string     | null: false                    |
| name               | string     | null: false                    |
| description        | string     | null: false                    |
| category           | string     | null: false                    |
| status             | string     | null: false                    |
| postage_type       | string     | null: false                    |
| prefectures        | string     | null: false                    |
| preparation_days   | integer    | null: false                    |
| value              | integar    | null: false                    |

### Association

- belongs_to :user
- belongs_to_active_hash :prefectures

## purchase テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |
| purchase_id        | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- belongs_to :purchase_id

## delivery テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| prefectures        | string     | null: false                    |
| city               | string     | null: false                    |
| block              | string     | null: false                    |
| building_name      | string     |                                |
| tel                | string     | null: false                    |
| purchase_id        | references | null: false                    |

### Association

- belongs_to :purchase_id
- belongs_to_active_hash :prefectures

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
