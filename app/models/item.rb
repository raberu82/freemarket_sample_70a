class Item < ApplicationRecord
  has_many :item_images
  has_many :messages
  belongs_to :category
  belongs_to :user, optional: true
  accepts_nested_attributes_for :item_images, allow_destroy: true
  validates :name ,presence: true,length: { maximum: 45 } 
  validates :item_images, presence: true
  validates :price, presence: true
  validates :explanation, presence: true,length: { maximum: 1000 } 
  validates :status, presence: true,exclusion: { in: %w(---) }
  validates :postage, presence: true,exclusion: { in: %w(---) }
  validates :ship_form_address, presence: true,exclusion: { in: %w(---) }
  validates :shipping_days, presence: true,exclusion: { in: %w(---) }
  validates :category_id, presence: true,exclusion: { in: %w(---) }
end