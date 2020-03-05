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
- has_many: identifications
- has_many: plofiles
- has_many: deliverys
- has_meny: user_images
- has_meny: credit_cards
- belongs_to: item

## identificationsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|yera_birth_at|date|null: false|
|month_birth_at|date|null: false|
|day_birth_at|date|null: false|
### Association
- belongs_to: users

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
- has_many: prefectures
- belongs_to: users

## plofilesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true||
|comment|text|
### Association
- has_meny: user_images
- belongs_to: users

## user_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true||
|user_image|string|
### Association
- belongs_to: plofiles


## prefecturesテーブル
|Column|Type|Options|
|------|----|-------|
|prefectures_id|integer|null: false, foreign_key: true||
|prefectures_name|string|null: false|
### Association
- belongs_to: deliverys

## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|card_number|integer|null: false|
|expiration_date_month_at|date|null: false|
|expiration_date_year_at|date|null: false|
|security_cpde|date|null: false|
### Association
- belongs_to: users

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|item_name|string|null: false,index: true|
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
- has_many: brands
- has_many: categorys
- has_many: messages
- belongs_to: users

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
|brand_id|integer|null: false, foreign_key: true||
|brand_name|string|null: false|
### Association
- belongs_to: item

## categorysテーブル
|Column|Type|Options|
|------|----|-------|
|category_id|integer|null: false, foreign_key: true||
|category_name|string|null: false|
|ancestry|string|
### Association
- belongs_to: item
- has_ancestry

## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
|massage|text|null: false|
### Association
- belongs_to: users
- belongs_to: items