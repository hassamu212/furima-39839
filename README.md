テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| email              | string | null: false,unique: true |
| encrypted_password | string | null: false              |
| nickname           | string | null: false              |
| family_name        | string | null: false              |
| first_name         | string | null: false              |
| family_name(kana)  | string | null: false              |
| first_name(kana)   | string | null: false              |
| birthday           | date   | null: false              |

### users テーブル Association

- has_many :items
- has_many :orders

## items テーブル

| Column              | Type       | Options                           |
| ------------------- | ---------- | --------------------------------- |
| item_title          | string     | null: false                       |
| item_concept        | text       | null: false                       |
| category            | genre_id   | null: false                       |
| status              | genre_id   | null: false                       |
| delivery_charge     | genre_id   | null: false                       |
| prefectures         | genre_id   | null: false                       |
| delivery_days       | genre_id   | null: false                       |
| price               | integer    | null: false                       |
| user                | references | null: false, foreign_key: true    |

### items テーブル Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column                   | Type       | Options                        |
| ------------------------ | ---------- | ------------------------------ |
| user                     | references | null: false, foreign_key: true |
| item                     | references | null: false, foreign_key: true |

### orders テーブル Association

- belongs_to :user
- belongs_to :item
- has_one :delivery_address

##  delivery_addresses テーブル

| Column              | Type       | Options                           |
| ------------------- | ---------- | --------------------------------- |
| address             | string     | null: false                       |
| prefectures         | genre_id   | null: false                       |
| municipalities      | string     | null: false                       |
| street_address      | string     | null: false                       |
| building_name       | string     |                                   |
| telephone_number    | string     | null: false                       |
| order               | references | null: false, foreign_key: true    |

### delivery_addresses テーブル Association

- belongs_to :order