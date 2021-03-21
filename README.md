# テーブル設計

## users

| Column          | Type   | Options    |
| --------------- | ------ | -------    |
| user-name       | string | null:false |
| email           | string | null:false |
| password        | string | null:false |
| name            | string | null:false |
| birthday        | string | null:false |

### Association

- has_many :items
- has_many :orders
- has_many :comments


## items

| Colum    | Type          | Options           |
| -------- | --------------| ----------------- |
| name     | string        | null:false        |
| price    | string        | null:false        |
| text     | text          | null:false        |
| image    | ActiveStorage |                   |
| user     | references    | foreign_key: true |

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


## Address

| Colum     | Type          | Options           |
| ----------| ------------- | ----------------- |
| postal    | string        | null:false        |
| city      | string        | null:false        |
| address   | string        | null:false        |
| apart     | string        | null:false        |
| number    | string        | null:false        |
| user      | references    | foreign_key: true |

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