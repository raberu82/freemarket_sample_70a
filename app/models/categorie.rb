class Categorie < ApplicationRecord
  mount_uploader :categories
  has_many :items
  has_ancestry
end
