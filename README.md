テーブル設計

## users テーブル

| Column             | Type   | Options        |
| ------------------ | ------ | -------------- |
| email              | string | null: false,UQ |
| encrypted_password | string | null: false    |
| nickname           | string | null: false    |
| name               | string | null: false    |
| name(kana)         | string | null: false    |
| birthday           | string | null: false    |

### users テーブル Association

- has_many :items
- has_many :orders
- has_many :delivery_address

## items テーブル

| Column              | Type       | Options                           |
| ------------------- | ---------- | --------------------------------- |
| item_image          | text       | null: false                       |
| item_title          | string     | null: false                       |
| item_concept        | text       | null: false                       |
| category            | string     | null: false                       |
| status              | string     | null: false                       |
| delivery_charge     | string     | null: false                       |
| delivery_area       | string     | null: false                       |
| delivery_days       | string     | null: false                       |
| price               | string     | null: false                       |
| user                | references | null: false, foreign_key: true    |

### items テーブル Association

- belongs_to :users
- has_one :orders
- has_one :delivery_address

## orders テーブル

| Column                   | Type       | Options                        |
| ------------------------ | ---------- | ------------------------------ |
| user                     | references | null: false, foreign_key: true |
| item                     | references | null: false, foreign_key: true |

### orders テーブル Association

- belongs_to :users
- belongs_to :items
- has_one :delivery_address

##  delivery_address テーブル

| Column              | Type       | Options                           |
| ------------------- | ---------- | --------------------------------- |
| address             | string     | null: false                       |
| prefectures         | string     | null: false                       |
| municipalities      | string     | null: false                       |
| street_address      | string     | null: false                       |
| building_name       | string     | null: false                       |
| telephone_number    | string     | null: false                       |
| item                | references | null: false, foreign_key: true    |
| user                | references | null: false, foreign_key: true    |
| order               | references | null: false, foreign_key: true    |

### delivery_address テーブル Association

- belongs_to :users
- belongs_to :items
- belongs_to :orders