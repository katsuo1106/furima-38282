
## users テーブル

| Column             | Type   | Options                   |
| -------------------| ------ | --------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first-name_kana    | string | null: false               |
| birthday           | data   | null: false               |

### Association
- has_many :items
- has_many :buyers

## itemsテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | -------------------------------|
| user              | references | null: false, foreign_key: true |
| item_name         | string     | null: false                    |
| item_description  | text       | null: false                    |
| category_id       | integer    | null: false                    |
| condition_id      | integer    | null: false                    |
| postage_id        | integer    | null: false                    |
| area_id           | integer    | null: false                    |
| delivery_day_id   | integer    | null: false                    |
| price             | integer    | null: false                    |

### Association
- belongs_to :user
- has_one :buyer

## buyersテーブル

| Column | Type       | Options                        |
| -------| -----------| -------------------------------|
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shopping_address

## shopping_addressesテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | -------------------------------|
| buyer         | references | null: false, foreign_key: true |
| post_code     | string     | null: false                    |
| area_id       | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |

### Association
- belongs_to :buyer