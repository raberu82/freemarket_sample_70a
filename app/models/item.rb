class Item < ApplicationRecord
  has_many :item_images
  has_many :messages
  belongs_to :category
  belongs_to :user, optional: true
  belongs_to :brand
end
