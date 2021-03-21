# テーブル設計

## users

| Column              | Type   | Options                  |
| ------------------- | ------ | ------------------------ |
| user_name           | string | null:false               |
| email               | string | unique: true, null:false |
| encrypted_password  | string | null:false               |
| family_name         | string | null:false               |
| last_name           | string | null:false               |
| family_name_2       | string | null:false               |
| last_name_2         | string | null:false               |
| birthday            | date   | null:false               | 

### Association

- has_many :items
- has_many :orders
- has_many :comments


## items

| Colum       | Type          | Options           |
| ----------- | --------------| ----------------- |
| name        | string        | null:false        |
| price       | integer       | null:false        |
| text        | text          | null:false        |
| user        | references    | foreign_key: true |
| category_id | integer       | null:false        |
| status_id   | integer       | null:false        |
| postage_id      | integer       | null:false        |
| area_id     | integer       | null:false        |
| data_id     | integer       | null:false        |

### Association

- has_many :comments
- belongs_to :user
- has_one :order


## orders

| Colum   | Type          | Options           |
| ------- | ------------- | ----------------- |
| user    | references    | foreign_key: true |
| item    | references    | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## Addresses

| Colum     | Type          | Options           |
| ----------| ------------- | ----------------- |
| postal    | string        | null:false        |
| city      | string        | null:false        |
| address   | string        | null:false        |
| apart     | string        |                   |
| number    | string        | null:false        |
| order     | references    | foreign_key: true |
| state_id  | integer       | null:false        |

### Association

-belongs_to :order


## Comments

| Column    | Type          | Options           |
| --------- | ------------- | ----------------- |
| text      | text          | null:false        |
| user      | references    | foreign_key: true |
| item      | references    | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item