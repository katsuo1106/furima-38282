
## users テーブル

| Column         | Type   | Options     |
| ---------------| ------ | ----------  |
| nickname       | string | null: false |
| email          | string | null: false |
| password       | string | null: false |
| last_name      | string | null: false |
| first_name     | string | null: false |
| last_name_kana | string | null: false |
| birthday       | data   | null: false |

### Association
- has_many :items
- has_many :buyers

## itemsテーブル

| Column            | Type       | Options     |
| ----------------- | ---------- | ------------|
| item_name         | string     | null: false |
| item_description  | text       | null: false |
| category          | text       | null: false |
| condition         | text       | null: false |
| postage           | text       | null: false |
| area              | text       | null: false |
| delivery_day      | data       | null: false |
| price             | integer    | null: false |

### Association
- belongs_to :user
- ha_one :buyer

## buyersテーブル

| Column | Type   | Options      |
| -------| -------| -------------|
| buyer  | string | null: false  |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shopping_address

## itemsテーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ------------|
| post_code     | string     | null: false |
| prefecture    | string     | null: false |
| city          | string     | null: false |
| address       | string     | null: false |
| building_name | string     |             |
| phone_number  | integer    | null: false |

### Association
- belongs_to :buyer