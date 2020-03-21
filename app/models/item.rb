class Item < ApplicationRecord
  has_many :item_images
  has_many :messages
  belongs_to :category
  belongs_to :user, optional: true
  # belongs_to :brand

  accepts_nested_attributes_for :item_images, allow_destroy: true
end