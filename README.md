# README

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true| 
|mail|string|null: false, unique: true|
|password|string|null: false|
### Association
- has_many: items
- has_many: messages
- has_one: plofiles

## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|birth_yera|date|null: false|
|birth_month|date|null: false|
|birth_day|date|null: false|
|comment|text|
|user_image|string|
### Association
- belongs_to: user

## deliverysテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false ,foreign_key: true|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|postcode|integer|null: false|
|prefecture_id|integenull: false|
|city|string|null: false|
|block|string|null: false|
|building|string|
|phone_number|integer|null: false|
### Association
- belongs_to: user

## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|card_number|integer|null: false|
|expiration_date_month_at|date|null: false|
|expiration_date_year_at|date|null: false|
|security_cpde|date|null: false|
### Association
- belongs_to: user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false,index: true|
|price|integer|null: false,index: true|
|users_id|integer|null: false, foreign_key: true|
|buyer_id|integer|null: false|
|explanation|string|null: false|
|status|string|null: false|
|postage|string|null: false| 
|ship_form_address|integer|null: false|
|shipping_days|integer|null: false|
### Association
- has_many: item_images
- has_many: messages
- belongs_to: category
- belongs_to: user
- belongs_to: brand

## item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true||
|item_image|string|null: false|
### Association
- belongs_to: item

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many: items

## categorysテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|
### Association
- has_many: items
- has_ancestry

## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
|massage|text|null: false|
### Association
- belongs_to: user
- belongs_to: item