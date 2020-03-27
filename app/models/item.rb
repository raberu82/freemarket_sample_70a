class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :status
  belongs_to_active_hash :postage
  belongs_to_active_hash :ship_form_address
  belongs_to_active_hash :shipping_days
  has_many :comments
  has_many :item_images
  accepts_nested_attributes_for :item_images, allow_destroy: true
  belongs_to :category
  belongs_to :user, optional: true
  validates :name ,presence: true, length: { maximum: 45 } 
  validates :item_images, presence: true
  validates :price, presence: true, numericality: { greater_than: 299 ,less_than: 10000000 }
  validates :explanation, presence: true, length: { maximum: 1000 } 
  validates :status, presence: true, exclusion: { in: %w(---) }
  validates :postage, presence: true, exclusion: { in: %w(---) }
  validates :ship_form_address, presence: true, exclusion: { in: %w(---) }
  validates :shipping_days, presence: true, exclusion: { in: %w(---) }
  validates :category_id, presence: true, exclusion: { in: %w(---) }

  def self.search(search)
    if search
      Item.where('name LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end
end
